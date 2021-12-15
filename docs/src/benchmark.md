# Run a benchmark with OptimizationProblems.jl

In this more advanced tutorial, we use the problems from `OptimizationProblems` to run a benchmark for unconstrained problems.
The tutorial will use:
- [JSOSolvers](https://github.com/JuliaSmoothOptimizers/JSOSolvers.jl): This package provides optimization solvers in pure Julia for unconstrained and bound-constrained optimization.
- [NLPModelsJuMP](https://github.com/JuliaSmoothOptimizers/NLPModelsJuMP.jl): This package convert JuMP model in `NLPModel` format.
- [SolverBenchmark](https://github.com/JuliaSmoothOptimizers/SolverBenchmark.jl): This package provides general tools for benchmarking solvers.

``` @example ex1
using JSOSolvers, NLPModels, NLPModelsJuMP, OptimizationProblems, OptimizationProblems.PureJuMP, SolverBenchmark
```
We select the problems from `PureJuMP` submodule of `OptimizationProblems` converted in [NLPModels](https://github.com/JuliaSmoothOptimizers/NLPModels.jl) using [NLPModelsJuMP](https://github.com/JuliaSmoothOptimizers/NLPModelsJuMP.jl).
``` @example ex1
problems = (MathOptNLPModel(eval(problem)(), name=string(problem)) for problem ∈ filter(x -> x != :PureJuMP, names(OptimizationProblems.PureJuMP)))
```

The same can be achieved using `OptimizationProblems.ADNLPProblems` as follows:
``` @example ex1
using ADNLPModels
ad_problems = (eval(problem)() for problem ∈ setdiff(names(OptimizationProblems.ADNLPProblems), [:ADNLPProblems, :clplatea, :clplateb, :clplatec, :fminsrf2]))
```

We also define a dictionary of solvers that will be used for our benchmark. We consider here `JSOSolvers.lbfgs` and `JSOSolvers.trunk`.
``` @example ex1
solvers = Dict(
  :lbfgs => model -> lbfgs(model, mem=5, atol=1e-5, rtol=0.0),
  :trunk => model -> trunk(model, atol=1e-5, rtol=0.0),
)
```
The function `SolverBenchmark.bmak_solvers` will run all the problems on the specified solvers and store the results in a `DataFrame`.
At this stage, we discard the problems that have constraints or bounds using `!unconstrained(prob)`, and those that are too large or too small with `get_nvar(prob) > 100 || get_nvar(prob) < 5`.
``` @example ex1
stats = bmark_solvers(
  solvers, problems,
  skipif=prob -> (!unconstrained(prob) || get_nvar(prob) > 100 || get_nvar(prob) < 5),
)
```
We can explore the results solver by solver in `stats[:lbfgs]` and `stats[:trunk]`, or get a profile wall using `SolverBenchmark.profile_solvers`.
``` @example ex1
cols = [:id, :name, :nvar, :objective, :dual_feas, :neval_obj, :neval_grad, :neval_hess, :iter, :elapsed_time, :status]
header = Dict(
  :nvar => "n",
  :objective => "f(x)",
  :dual_feas => "‖∇f(x)‖",
  :neval_obj => "# f",
  :neval_grad => "# ∇f",
  :neval_hess => "# ∇²f",
  :elapsed_time => "t",
)

for solver ∈ keys(solvers)
  pretty_stats(stats[solver][!, cols], hdr_override=header)
end
```

``` @example ex1
first_order(df) = df.status .== :first_order
unbounded(df) = df.status .== :unbounded
solved(df) = first_order(df) .| unbounded(df)
costnames = ["time", "obj + grad + hess"]
costs = [
  df -> .!solved(df) .* Inf .+ df.elapsed_time,
  df -> .!solved(df) .* Inf .+ df.neval_obj .+ df.neval_grad .+ df.neval_hess,
]

using Plots
gr()

profile_solvers(stats, costs, costnames)
```
