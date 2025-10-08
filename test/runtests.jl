using NLPModels, NLPModelsJuMP, OptimizationProblems, Test

@test names(ADNLPProblems) == [:ADNLPProblems]

import ADNLPModels

# Temporarily run only the browngen problem for targeted testing
list_problems = [:browngen]
@test length(list_problems) > 0

include("test_utils.jl")

@test ndef == OptimizationProblems.PureJuMP.default_nvar
@test ndef == OptimizationProblems.ADNLPProblems.default_nvar

@testset "problem: $prob" for prob in list_problems
  pb = string(prob)

  nvar = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))()
  ncon = OptimizationProblems.eval(Symbol(:get_, prob, :_ncon))()

  nlp_ad = if (nvar + ncon < 10000)
    eval(Meta.parse("ADNLPProblems.$(prob)()"))
  else
    # Avoid SparseADJacobian for too large problem as it requires a lot of memory for CIs
    eval(Meta.parse("ADNLPProblems.$(prob)(" * simp_backend * ")"))
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
    nls_prob = eval(Meta.parse("ADNLPProblems.$(prob)(use_nls = true)"))
    if (typeof(nls_prob) <: ADNLPModels.ADNLSModel) # if the nls_flag is not supported we ignore the prob
      test_in_place_residual(prob, nls_prob)
    end
  end

  @testset "Test problems compatibility for $prob" begin
    prob_fn = eval(Meta.parse("PureJuMP.$(prob)"))
    model = prob_fn(n = ndef)
    nlp_jump = MathOptNLPModel(model)
    test_compatibility(prob, nlp_jump, nlp_ad, ndef)
  end
end

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
