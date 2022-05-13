# Contributing to OptimizationProblems.jl

First off, thanks for taking the time to contribute!

## Bug reports and discussions

If you think you found a bug, feel free to open an [issue](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/issues).
Focused suggestions and requests can also be opened as issues. Before opening a pull request, please start an issue or a discussion.

If you want to ask a question not suited for a bug report, feel free to start a discussion [here](https://github.com/JuliaSmoothOptimizers/Organization/discussions), a forum for general discussion about this repository and the [JuliaSmoothOptimizers](https://github.com/JuliaSmoothOptimizers) organization. Discussions about any of our packages are welcome.

## Adding new problems

We welcome pull requests proposing new problems to the problem set. As a general guideline, a pull request should concern one problem only. We recommend checking existing problems as a template for your new problems.

Here is a to-do list, to help you add new problems:
* Before implementing a new problem, make sure it does not already exist in this repository.
* This package contains implementations using [`JuMP`](https://github.com/jump-dev/JuMP.jl) and [`ADNLPModels`](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl). A pull request should include both implementations of a new problem. Additionally, a "meta" provides general information regarding the problem. Therefore, a PR adding a new problem should contain 3 files:
    - `src/ADNLPProblems/problem_name.jl`
    - `src/PureJuMP/problem_name.jl`
    - `src/Meta/problem_name.jl`
In both cases, the function must have the same name `problem_name` as the file.
* When submitting a problem, please pay particular attention to the documentation. We would like to gather as much information as possible on the provenance of problems, other problem sets where the problems are present, and general information on the problem. 
The documentation should be added to the file in the `PureJuMP` folder.
* New problems can be scalable, see [ADNLPProblems/arglina.jl](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/arglina.jl) and [PureJuMP/arglina.jl](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/PureJuMP/arglina.jl) for examples. In that case, the first keyword parameter should be the number of variables `n::Int` and have the default value `default_nvar` (constant predefined in the module). If your problem has restrictions on the number of variables, e.g., `n` should be odd, or `n` should have the form `4k + 3`, then, instead of throwing errors when the restrictions are not satisfied, you should instead use the number of variables to be as close to `n` as possible. For example, if you want `n` odd and `n = 100` is passed, you can internally convert to `n = 99`. If you want `n = 4k + 3`, and `n = 100` is passed, then compute `k = round(Int, (n - 3) / 4)` and update `n`.
* A first version of the `meta` can be generated using `generate_meta`. A `String` is returned that can be copy-pasted into the `Meta` folder, and then edited.

```julia
    using ADNLPModels, NLPModels, NLPModelsJuMP, OptimizationProblems
    include("test/utils.jl")
    # there must exists a function `problem_name` which loads the model in the environment
    name = "problem_name"
    open("$name.jl", "w") do io
      print(io, generate_meta(name))
    end
```

* Problems modeled with `ADNLPModels` should be type-stable, i.e. they should all have keyword argument `type::Val{T} = Val(Float64)` where `T` is the type of the initial guess and the type used by the `NLPModel` API.

## Templates for the new functions

In order to standardize the new functions, we offer here a template for both AD and JuMP models.

First, we describe the `PureJuMP` file `function_name.jl`. This file contains the documentation on the problem.
```
# Full name of the problem (while function_name could be an abbreviation)
#
# Source of the problem
# Don't hesitate to put more than one source if it is mentioned elsewhere
#
# CUTEst classification (if available)
#
# other information related to the problem
#

export function_name

"A short docstring on the problem"
function function_name(; n::Int = default_nvar, kwargs...)
  nlp = Model()
  # define the model: TODO
  return nlp
end
```

Next, we describe the `ADNLPProblems` file `function_name.jl`.
```
export function_name

function function_name(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T} 
  # define f 
  # define x0
  # nlp = ADNLPModels.ADNLPModel(f, x0, name = "function_name"; kwargs...)
  return nlp
end
```
