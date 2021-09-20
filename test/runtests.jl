using NLPModels, NLPModelsJuMP, OptimizationProblems, Test

function vio(c, l, u)
  return max.(max.(c - u, 0), max.(-c + l, 0))
end

@test names(OptimizationProblems.ADNLPProblems) == [:ADNLPProblems]

import ADNLPModels

ndef = OptimizationProblems.ADNLPProblems.default_nvar

# Test that every problem can be instantiated.
for prob in names(OptimizationProblems.PureJuMP)
  prob == :PureJuMP && continue
  println(prob)
  prob_fn = eval(Meta.parse("OptimizationProblems.PureJuMP.$(prob)"))
  model = prob_fn(ndef)

  prob == :fminsrf2 && continue # issue because variable is a matrix!
  prob == :hs61 && continue #because nlpmodelsjump is not working here https://github.com/JuliaSmoothOptimizers/NLPModelsJuMP.jl/issues/84
  prob in [:clplatea, :clplateb, :clplatec] && continue # issue because variable is a matrix!

  nlp_jump = MathOptNLPModel(model)
  nlp_ad = eval(Meta.parse("OptimizationProblems.ADNLPProblems.$(prob)()"))

  @test (nlp_jump.meta.nvar == nlp_ad.meta.nvar) && (nlp_jump.meta.x0 == nlp_ad.meta.x0)
  @test nlp_jump.meta.ncon == nlp_ad.meta.ncon
  @test (nlp_jump.meta.lvar == nlp_ad.meta.lvar) && (nlp_jump.meta.uvar == nlp_ad.meta.uvar)

  x1 = nlp_ad.meta.x0 + rand(nlp_ad.meta.nvar)/10
  x2 = nlp_ad.meta.x0 + rand(nlp_ad.meta.nvar)/10
  n0 = max(abs(obj(nlp_ad, nlp_ad.meta.x0)), 1)
  @test isapprox(obj(nlp_ad, x1), obj(nlp_jump, x1), atol=1e-14 * n0) 
  @test isapprox(obj(nlp_ad, x2), obj(nlp_jump, x2), atol=1e-14 * n0)

  for xj in [x1, x2]
    vioad = vio(cons(nlp_ad, xj) , nlp_ad.meta.lcon, nlp_ad.meta.ucon)
    vioju = vio(cons(nlp_jump, xj), nlp_jump.meta.lcon, nlp_jump.meta.ucon)
    @test isapprox(vioad, vioju)
  end
end

for prob in names(OptimizationProblems.ADNLPProblems)
  prob == :ADNLPProblems && continue
  prob == :fminsrf2 && continue # issue because variable is a matrix
  prob in [:clplatea, :clplateb, :clplatec] && continue # issue because variable is a matrix

  println(prob)
  try
    n, m = eval(Meta.parse("OptimizationProblems.ADNLPProblems.get_$(prob)_meta(n=$(2 * ndef))"))
    meta_pb = eval(Meta.parse("OptimizationProblems.ADNLPProblems.$(prob)_meta"))
    if meta_pb[:variable_size]
      @test n != meta_pb[:nvar]
    else
      @test n == meta_pb[:nvar]
    end
    if meta_pb[:variable_con_size]
      @test m != meta_pb[:ncon]
    else
      @test m == meta_pb[:ncon]
    end
  catch
    # prob_meta and get_prob_meta not defined for all problems yet.
  end

  for T in [Float32, Float64]
    nlp = eval(Meta.parse("OptimizationProblems.ADNLPProblems.$(prob)(type=$(Val(T)))"))
    x0 = nlp.meta.x0
    @test eltype(x0) == T
    @test typeof(obj(nlp, x0)) == T
    if nlp.meta.ncon > 0
      @test eltype(cons(nlp, x0)) == T
    end
  end
end
