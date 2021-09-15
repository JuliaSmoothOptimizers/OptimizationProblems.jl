using OptimizationProblems, Test

# Test that every problem can be instantiated.
for prob in names(OptimizationProblems.PureJuMP)
  prob == :PureJuMP && continue
  println(prob)
  prob_fn = eval(Meta.parse("OptimizationProblems.PureJuMP.$(prob)"))
  prob_fn()
end
