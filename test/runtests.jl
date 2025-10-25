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

@test ndef == OptimizationProblems.PureJuMP.default_nvar
@test ndef == OptimizationProblems.ADNLPProblems.default_nvar

@everywhere function make_ad_nlp(prob::Symbol; simp_backend="")
    mod = ADNLPProblems
    if !isdefined(mod, prob)
        error("Problem $(prob) is not defined in ADNLPProblems on pid $(myid()).")
    end
    ctor = getfield(mod, prob)
    return isempty(simp_backend) ? ctor() : ctor(eval(Meta.parse(simp_backend)))
end

@everywhere function test_one_problem(prob::Symbol)
  pb = string(prob)

  nvar = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))()
  ncon = OptimizationProblems.eval(Symbol(:get_, prob, :_ncon))()

  nlp_ad = if (nvar + ncon < 10000)
    make_ad_nlp(prob)
  else
    # Avoid SparseADJacobian for too large problem as it requires a lot of memory for CIs
    make_ad_nlp(prob, simp_backend = simp_backend)
  end

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

names_pb_vars = meta[
  meta.variable_nvar .== true,
  [:nvar, :name, :best_known_upper_bound, :best_known_lower_bound],
]
adproblems = (
  eval(Meta.parse("ADNLPProblems.$(pb[:name])(" * simp_backend * ")")) for
  pb in eachrow(names_pb_vars)
)
adproblems11 = (
  eval(Meta.parse("ADNLPProblems.$(pb[:name])(n=$(13 * ndef), " * simp_backend * ")")) for
  pb in eachrow(names_pb_vars)
)

@testset "Test scalable problems" begin
  @testset "problem: $pb" for (pb, nlp, nlp11) in
                              zip(eachrow(names_pb_vars), adproblems, adproblems11)
    @test pb[:nvar] == nlp.meta.nvar
    n11 = OptimizationProblems.eval(Symbol(:get_, pb[:name], :_nvar))(n = 13 * ndef)
    @test n11 == nlp11.meta.nvar

    # test that the problem is actually scalable
    @test n11 != pb[:nvar]
  end
end

rmprocs()
