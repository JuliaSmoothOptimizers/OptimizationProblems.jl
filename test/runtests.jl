using NLPModels, NLPModelsJuMP, OptimizationProblems, Test

@test names(ADNLPProblems) == [:ADNLPProblems]

import ADNLPModels

ndef = OptimizationProblems.default_nvar

@test ndef == OptimizationProblems.PureJuMP.default_nvar
@test ndef == OptimizationProblems.ADNLPProblems.default_nvar

test_nvar = Int(round(ndef / 2))

meta = OptimizationProblems.meta

function meta_sanity_check(prob::Symbol, nlp::AbstractNLPModel)
  meta = OptimizationProblems.eval(Symbol(prob, :_meta))
  getnvar = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))(n = test_nvar)
  @test getnvar == meta[:nvar] || meta[:variable_nvar]
  getncon = OptimizationProblems.eval(Symbol(:get_, prob, :_ncon))(n = test_nvar)
  @test getncon == meta[:ncon] || meta[:variable_ncon]
  getnlin = OptimizationProblems.eval(Symbol(:get_, prob, :_nlin))(n = test_nvar)
  @test getnlin == nlp.meta.nlin || meta[:variable_ncon]
  getnnln = OptimizationProblems.eval(Symbol(:get_, prob, :_nnln))(n = test_nvar)
  @test getnnln == nlp.meta.nnln || meta[:variable_ncon]
  getnequ = OptimizationProblems.eval(Symbol(:get_, prob, :_nequ))(n = test_nvar)
  @test getnequ == length(get_jfix(nlp)) || meta[:variable_ncon]
  getnineq = OptimizationProblems.eval(Symbol(:get_, prob, :_nineq))(n = test_nvar)
  @test getnineq == (get_ncon(nlp) - length(get_jfix(nlp))) || meta[:variable_ncon]
  @test meta[:best_known_lower_bound] <= meta[:best_known_upper_bound]
  @test meta[:minimize] == get_minimize(nlp)
  @test meta[:has_equalities_only] == (length(get_jfix(nlp)) == get_ncon(nlp) > 0)
  @test meta[:has_inequalities_only] == (get_ncon(nlp) > 0 && length(get_jfix(nlp)) == 0)
  @test meta[:has_bounds] == (length(get_ifree(nlp)) < get_nvar(nlp))
  @test meta[:has_fixed_variables] == (get_ifix(nlp) != [])
end

# Test that every problem can be instantiated.
@testset "Test problems compatibility" begin
  @testset "problem: $prob" for prob in names(PureJuMP)
    prob == :PureJuMP && continue

    prob_fn = eval(Meta.parse("PureJuMP.$(prob)"))
    model = prob_fn(n = ndef)

    prob == :hs61 && continue #because nlpmodelsjump is not working here https://github.com/JuliaSmoothOptimizers/NLPModelsJuMP.jl/issues/84

    nlp_jump = MathOptNLPModel(model)
    nvar = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))()
    ncon = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))()
    nlp_ad = if (nvar + ncon < 10000)
      eval(Meta.parse("ADNLPProblems.$(prob)()"))
    else
      # Avoid SparseADJacobian for too large problem as it requires a lot of memory for CIs
      eval(
        Meta.parse(
          "ADNLPProblems.$(prob)(jacobian_backend = ADNLPModels.ForwardDiffADJacobian, hessian_backend = ADNLPModels.ForwardDiffADHessian)",
        ),
      )
    end

    @test nlp_jump.meta.nvar == nlp_ad.meta.nvar
    @test nlp_jump.meta.x0 == nlp_ad.meta.x0
    @test nlp_jump.meta.ncon == nlp_ad.meta.ncon
    @test nlp_jump.meta.lvar == nlp_ad.meta.lvar
    @test nlp_jump.meta.uvar == nlp_ad.meta.uvar

    x1 = nlp_ad.meta.x0
    x2 = nlp_ad.meta.x0 .+ 0.01
    n0 = max(abs(obj(nlp_ad, nlp_ad.meta.x0)), 1)
    @test isapprox(obj(nlp_ad, x1), obj(nlp_jump, x1), atol = 1e-14 * n0)
    @test isapprox(obj(nlp_ad, x2), obj(nlp_jump, x2), atol = 1e-14 * n0)
    grad(nlp_ad, x1) # just test that it runs

    if nlp_ad.meta.ncon > 0
      @test nlp_ad.meta.lcon == nlp_jump.meta.lcon
      @test nlp_ad.meta.ucon == nlp_jump.meta.ucon
      @test all(isapprox.(cons(nlp_ad, x1), cons(nlp_jump, x1), atol = 1e-10 * n0))
      @test all(isapprox.(cons(nlp_ad, x2), cons(nlp_jump, x2), atol = 1e-10 * n0))
      @test nlp_jump.meta.lin == nlp_ad.meta.lin
    end

    meta_sanity_check(prob, nlp_ad)
  end
end

@testset "Test multi-precision ADNLPProblems" begin
  @testset "problem: $(prob)" for prob in names(ADNLPProblems)
    prob == :ADNLPProblems && continue

    nvar = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))()
    ncon = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))()

    for T in [Float32, Float64]
      nlp = if (nvar + ncon < 10000)
        eval(Meta.parse("ADNLPProblems.$(prob)(type=$(Val(T)))"))
      else
        # Avoid SparseADJacobian for too large problem as it requires a lot of memory for CIs
        eval(
          Meta.parse(
            "ADNLPProblems.$(prob)(type=$(Val(T)), jacobian_backend = ADNLPModels.ForwardDiffADJacobian, hessian_backend = ADNLPModels.ForwardDiffADHessian)",
          ),
        )
      end
      x0 = nlp.meta.x0
      @test eltype(x0) == T
      @test typeof(obj(nlp, x0)) == T
      if nlp.meta.ncon > 0
        @test eltype(cons(nlp, x0)) == T
      end
    end
  end
end

names_pb_vars = meta[
  meta.variable_nvar .== true,
  [:nvar, :name, :best_known_upper_bound, :best_known_lower_bound],
]
adproblems = (eval(Meta.parse("ADNLPProblems.$(pb[:name])()")) for pb in eachrow(names_pb_vars))
adproblems11 =
  (eval(Meta.parse("ADNLPProblems.$(pb[:name])(n=$(13 * ndef))")) for pb in eachrow(names_pb_vars))

@testset "Test scalable problems" begin
  @testset "problem: $pb" for (pb, nlp, nlp11) in
                              zip(eachrow(names_pb_vars), adproblems, adproblems11)
    @test pb[:nvar] == nlp.meta.nvar
    n11 = OptimizationProblems.eval(Symbol(:get_, pb[:name], :_nvar))(n = 13 * ndef)
    @test n11 == nlp11.meta.nvar
  end
end
