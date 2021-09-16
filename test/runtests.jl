using NLPModels, OptimizationProblems, Test

# Test that every problem can be instantiated.
for prob in names(OptimizationProblems.PureJuMP)
  prob == :PureJuMP && continue
  println(prob)
  prob_fn = eval(Meta.parse("OptimizationProblems.PureJuMP.$(prob)"))
  prob_fn()
end

ndef = OptimizationProblems.ADNLPProblems.default_nvar
for prob in names(OptimizationProblems.ADNLPProblems)
  prob == :ADNLPProblems && continue
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

  for T in [Float32, Float64]
    nlp = eval(Meta.parse("OptimizationProblems.ADNLPProblems.$(prob)(type=$(Val(T)))"))
    x0 = nlp.meta.x0
    @test eltype(x0) == T
    @test typeof(obj(nlp, x0)) == T
    if nlp.meta.ncon > 0
      @test typeof(obj(nlp, x0)) == T
    end
  end
end