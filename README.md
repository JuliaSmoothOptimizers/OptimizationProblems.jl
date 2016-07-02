# OptimizationProblems

[![Build Status](https://travis-ci.org/JuliaSmoothOptimizers/OptimizationProblems.jl.svg?branch=master)](https://travis-ci.org/JuliaSmoothOptimizers/OptimizationProblems.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/270y5330ihk30v41?svg=true)](https://ci.appveyor.com/project/dpo/optimizationproblems-jl)
[![Coverage Status](https://coveralls.io/repos/JuliaSmoothOptimizers/OptimizationProblems.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/JuliaSmoothOptimizers/OptimizationProblems.jl?branch=master)

A collection of optimization problems in
[JuMP](https://github.com/JuliaOpt/JuMP.jl) syntax.

## Installing

```JULIA
julia> Pkg.clone("https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl.git")
```

You can obtain the list of problems currently defined with
`names(OptimizationProblems)`. The first symbol in the list is
`:OptimizationProblems` itself&ndash;the name of the module.

Currently, only a few unconstrained problems are implemented. Some are
available in variable size.

This module is particularly useful in conjunction with
[NLPModels](https://github.com/JuliaSmoothOptimizers/NLPModels.jl) to facilitate evaluating
objective, constraints and their derivatives.

## Contributing

Please open pull requests to submit new problems! When submitting a problem,
please pay particular attention to the documentation. We would like to gather
as much information as possible on the provenance of problems.
