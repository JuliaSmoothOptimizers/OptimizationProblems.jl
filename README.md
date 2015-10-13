# OptimizationProblems

[![Build Status](https://travis-ci.org/dpo/OptimizationProblems.jl.svg?branch=master)](https://travis-ci.org/dpo/OptimizationProblems.jl)

A collection of optimization problems in
[JuMP](https://github.com/JuliaOpt/JuMP.jl) syntax.

## Installing

```JULIA
julia> Pkg.clone("https://github.com/dpo/OptimizationProblems.jl.git")
```

You can obtain the list of problems currently defined with
`names(OptimizationProblems)`. The first symbol in the list is
`:OptimizationProblems` itself&ndash;the name of the module.

Currently, only a few unconstrained problems are implemented. Some are
available in variable size.

This module is particularly useful in conjunction with
[NLPModels](https://github.com/dpo/NLPModels.jl) to facilitate evaluating
objective, constraints and their derivatives.

## Contributing

Please open pull requests to submit new problems! When submitting a problem,
please pay particular attention to the documentation. We would like to gather
as much information as possible on the provenance of problems.
