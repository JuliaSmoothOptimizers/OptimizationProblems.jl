using Distributed

np = Sys.CPU_THREADS
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
const list_problems_not_ADNLPProblems = Symbol[]
const list_problems_ADNLPProblems = setdiff(list_problems, list_problems_not_ADNLPProblems)
const list_problems_not_PureJuMP = Symbol[]
const list_problems_PureJuMP = setdiff(list_problems, list_problems_not_PureJuMP)

include("test-defined-problems.jl")
@everywhere include("test-utils.jl")

@everywhere function make_ad_nlp(prob::Symbol; kwargs...)
    mod = ADNLPProblems
    if !isdefined(mod, prob)
        error("Problem $(prob) is not defined in ADNLPProblems on pid $(myid()).")
    end
    ctor = getfield(mod, prob)
    return ctor(matrix_free = true; kwargs...)
end

@everywhere function test_one_problem(prob::Symbol)
  pb = string(prob)

  nvar = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))()
  ncon = OptimizationProblems.eval(Symbol(:get_, prob, :_ncon))()

  nlp_ad = make_ad_nlp(prob)

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

  @testset "Test for nls_prob flag for $prob" begin
    nls_prob = begin
      mod = ADNLPProblems
      if isdefined(mod, prob)
            getfield(mod, prob)(; use_nls = true)
      else
            nothing
      end
    end
    if (typeof(nls_prob) <: ADNLPModels.ADNLSModel) # if the nls_flag is not supported we ignore the prob
      test_in_place_residual(prob, nls_prob)
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
