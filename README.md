# OptimizationProblems

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3672094.svg)](https://doi.org/10.5281/zenodo.3672094)
[![CI](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/workflows/CI/badge.svg?branch=main)](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/actions)
[![Build Status](https://api.cirrus-ci.com/github/JuliaSmoothOptimizers/OptimizationProblems.jl.svg)](https://cirrus-ci.com/github/JuliaSmoothOptimizers/OptimizationProblems.jl)
[![codecov](https://codecov.io/gh/JuliaSmoothOptimizers/OptimizationProblems.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/JuliaSmoothOptimizers/OptimizationProblems.jl)
[![Documentation/stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://JuliaSmoothOptimizers.github.io/OptimizationProblems.jl/stable)
[![Documentation/dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://JuliaSmoothOptimizers.github.io/OptimizationProblems.jl/dev)

This package provides a collection of optimization problems in
[JuMP](https://github.com/JuliaOpt/JuMP.jl) and [ADNLPModels](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl) syntax.

## Installing

OptimizationProblems can be installed and tested through the Julia package manager:

```julia
julia> ]
pkg> add OptimizationProblems
pkg> test OptimizationProblems
```

You can obtain the list of problems currently defined with
`names(OptimizationProblems.PureJuMP)`. The first symbol in the list is
`:PureJuMP` itself&ndash;the name of the module.

Currently, only a few unconstrained problems are implemented. Some are
available in variable size.

This module is particularly useful in conjunction with
[NLPModels](https://github.com/JuliaSmoothOptimizers/NLPModels.jl) to facilitate evaluating
objective, constraints and their derivatives.

## Contributing

Please open pull requests to submit new problems! When submitting a problem,
please pay particular attention to the documentation. We would like to gather
as much information as possible on the provenance of problems. The documentation [Contributing](https://juliasmoothoptimizers.github.io/OptimizationProblems.jl/dev/contributing/) provides general guidelines on how to suggest new problems.

## How to cite

If you use OptimizationProblems.jl in your work, please cite using the format given in [CITATION.bib](CITATION.bib).
