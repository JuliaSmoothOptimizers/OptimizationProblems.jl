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
for prob in names(PureJuMP)
  prob == :PureJuMP && continue
  println(prob)
  prob_fn = eval(Meta.parse("PureJuMP.$(prob)"))
  model = prob_fn(ndef)

  prob == :hs61 && continue #because nlpmodelsjump is not working here https://github.com/JuliaSmoothOptimizers/NLPModelsJuMP.jl/issues/84

  nlp_jump = MathOptNLPModel(model)
  nlp_ad = eval(Meta.parse("ADNLPProblems.$(prob)()"))

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

  if nlp_ad.meta.ncon > 0
    @test nlp_ad.meta.lcon == nlp_jump.meta.lcon
    @test nlp_ad.meta.ucon == nlp_jump.meta.ucon
    @test isapprox(cons(nlp_ad, x1), cons(nlp_jump, x1))
    @test isapprox(cons(nlp_ad, x2), cons(nlp_jump, x2))
  end

  meta_sanity_check(prob, nlp_ad)
end

for prob in names(ADNLPProblems)
  prob == :ADNLPProblems && continue

  println(prob)

  for T in [Float32, Float64]
    nlp = eval(Meta.parse("ADNLPProblems.$(prob)(type=$(Val(T)))"))
    x0 = nlp.meta.x0
    @test eltype(x0) == T
    @test typeof(obj(nlp, x0)) == T
    if nlp.meta.ncon > 0
      @test eltype(cons(nlp, x0)) == T
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
for (pb, nlp, nlp11) in zip(eachrow(names_pb_vars), adproblems, adproblems11)
  @test pb[:nvar] == nlp.meta.nvar
  n11 = OptimizationProblems.eval(Symbol(:get_, pb[:name], :_nvar))(n = 13 * ndef)
  if n11 != nlp11.meta.nvar
    @show pb[:name], n11, nlp11.meta.nvar
  end
end
