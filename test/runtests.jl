using Distributed

np = max(1, Sys.CPU_THREADS ÷ 2)
addprocs(np - 1)

@everywhere using NLPModels, NLPModelsJuMP, OptimizationProblems, Test

@test names(ADNLPProblems) == [:ADNLPProblems]

@everywhere import ADNLPModels

@everywhere function defined_names(mod::Module)
  # Exported only (default) + actually defined. Adjust all=true if you prefer.
  [n for n in names(mod) if isdefined(mod, n)]
end

const list_problems =
  setdiff(union(defined_names(ADNLPProblems), defined_names(PureJuMP)), [:PureJuMP, :ADNLPProblems])

# The problems included should be carefully argumented and issues
# to create them added.
# TODO: tests are limited for JuMP-only problems
const list_problems_not_ADNLPProblems =
  Symbol[:catmix, :gasoil, :glider, :methanol, :minsurf, :pinene, :rocket, :steering, :torsion]
const list_problems_ADNLPProblems = setdiff(list_problems, list_problems_not_ADNLPProblems)
const list_problems_not_PureJuMP = Symbol[]
const list_problems_PureJuMP = setdiff(list_problems, list_problems_not_PureJuMP)

include("test-defined-problems.jl")
include("test-utils.jl")

@everywhere function make_nlp(prob::Symbol; kwargs...)
  if isdefined(ADNLPProblems, prob)
    return make_ad_nlp(prob; kwargs...)
  elseif isdefined(PureJuMP, prob)
    return make_jump_nlp(prob; kwargs...)
  else
    error("Problem $(prob) is not defined in ADNLPProblems or PureJuMP on pid $(myid()).")
  end
end

@everywhere function make_jump_nlp(prob::Symbol; kwargs...)
  mod = PureJuMP
  if !isdefined(mod, prob)
    error("Problem $(prob) is not defined in $mod on pid $(myid()).")
  end
  ctor = getfield(mod, prob)
  return MathOptNLPModel(ctor(; kwargs...))
end

@everywhere function make_ad_nlp(prob::Symbol; kwargs...)
  mod = ADNLPProblems
  if !isdefined(mod, prob)
    error("Problem $(prob) is not defined in $mod on pid $(myid()).")
  end
  ctor = getfield(mod, prob)
  return ctor(matrix_free = true; kwargs...)
end

@everywhere function test_one_problem(prob::Symbol)
  pb = string(prob)

  nvar = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))()
  ncon = OptimizationProblems.eval(Symbol(:get_, prob, :_ncon))()

  function timed_info(label, f, args...; kwargs...)
    stats = @timed f(args...; kwargs...)
    msg =
      "$(label) took $(round(stats.time, digits=2)) s " *
      "($(Base.format_bytes(stats.bytes)) allocated, " *
      "GC $(round(100*stats.gctime/stats.time, digits=1)) %)"
    @info msg
    return stats.value
  end

  nlp_ad = timed_info("Instantiating $(pb)", make_nlp, prob)

  @test nlp_ad.meta.name == pb

  if pb in meta[(meta.contype .== :quadratic) .| (meta.contype .== :general), :name]
    @testset "Test In-place Nonlinear Constraints for AD-$prob" begin
      test_in_place_constraints(prob, nlp_ad)
    end
  end

  @testset "Test multi-precision ADNLPProblems for $prob" begin
    test_multi_precision(prob, nlp_ad)
  end

  if pb in meta[meta.objtype .== :least_squares, :name]
    @testset "Test Nonlinear Least Squares for $prob" begin
      test_in_place_residual(prob)
    end
  end

  model = begin
    mod = PureJuMP
    if isdefined(mod, prob)
      getfield(mod, prob)(n = ndef)
    else
      nothing
    end
  end
  if !isnothing(model)
    @testset "Test problems compatibility for $prob" begin
      nlp_jump = MathOptNLPModel(model)
      test_compatibility(prob, nlp_jump, nlp_ad, ndef)
    end
  end
end

pmap(test_one_problem, list_problems_ADNLPProblems)

include("test-scalable.jl")

rmprocs()
