using NLPModels, NLPModelsJuMP, OptimizationProblems, Test

@test names(ADNLPProblems) == [:ADNLPProblems]

import ADNLPModels

ndef = OptimizationProblems.default_nvar

@test ndef == OptimizationProblems.PureJuMP.default_nvar
@test ndef == OptimizationProblems.ADNLPProblems.default_nvar

test_nvar = Int(round(ndef / 2))

meta = OptimizationProblems.meta

# Avoid SparseADJacobian/Hessian for too large problem as it requires a lot of memory for CIs
simp_backend = "jacobian_backend = ADNLPModels.ForwardDiffADJacobian, hessian_backend = ADNLPModels.ForwardDiffADHessian"

include("test_utils.jl")

@testset "Test In-place Nonlinear Constraints" begin
  @testset "problem: $pb" for pb in meta[
    (meta.contype .== :quadratic) .| (meta.contype .== :general),
    :name,
  ]
    test_in_place_constraints(Symbol(pb))
  end
end

@testset "Test Nonlinear Least Squares" begin
  @testset "problem: $pb" for pb in meta[meta.objtype .== :least_squares, :name]
    test_in_place_residual(Symbol(pb))
  end
end

# Test that every problem can be instantiated.
@testset "Test problems compatibility" begin
  @testset "problem: $prob" for prob in names(PureJuMP)
    prob == :PureJuMP && continue
    prob == :hs61 && continue #because nlpmodelsjump is not working here https://github.com/JuliaSmoothOptimizers/NLPModelsJuMP.jl/issues/84

    test_compatibility(prob, ndef)
  end
end

@testset "Test multi-precision ADNLPProblems" begin
  @testset "problem: $(prob)" for prob in names(ADNLPProblems)
    prob == :ADNLPProblems && continue
    test_multi_precision(prob)
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
  end
end
