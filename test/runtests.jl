using OptimizationProblems, Test

# Test that every problem can be instantiated.
for prob in names(OptimizationProblems)
  prob == :OptimizationProblems && continue
  println(prob)
  prob_fn = eval(prob)
  prob_fn()
end
