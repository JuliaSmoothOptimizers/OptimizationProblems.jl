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
The function should be exported from `src/ADNLPProblems/problem_name.jl` and `src/PureJuMP/problem_name.jl`. Do not add exports in `src/Meta/problem_name.jl`.
* When submitting a problem, please pay particular attention to the documentation. We would like to gather as much information as possible on the provenance of problems, other problem sets where the problems are present, and general information on the problem. 
The documentation should be added to the file in the `PureJuMP` folder.
* New problems can be scalable, see [ADNLPProblems/arglina.jl](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/arglina.jl) and [PureJuMP/arglina.jl](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/PureJuMP/arglina.jl) for examples. In that case, the first keyword parameter should be the number of variables `n::Int` and have the default value `default_nvar` (constant predefined in the module). If your problem has restrictions on the number of variables, e.g., `n` should be odd, or `n` should have the form `4k + 3`, then, instead of throwing errors when the restrictions are not satisfied, you should instead use the number of variables to be as close to `n` as possible. For example, if you want `n` odd and `n = 100` is passed, you can internally convert to `n = 99`. If you want `n = 4k + 3`, and `n = 100` is passed, then compute `k = round(Int, (n - 3) / 4)` and update `n`. When such an internal adjustment is made, emit a warning indicating the requested `n` and the effective value used.
* A first version of the `meta` can be generated using `generate_meta`. A `String` is returned that can be copy-pasted into the `Meta` folder, and then edited.

```julia
    using ADNLPModels, Distributed, NLPModels, NLPModelsJuMP, OptimizationProblems, Test
    include("test/utils.jl")
    # there must exists a function `problem_name` which loads the model in the environment,
    # it must be exported.
    create_meta_files(String["catmix", "gasoil", "glider", "methanol", "pinene", "rocket", "steering"])
```

* Problems modeled with `ADNLPModels` should be type-stable, i.e. they should all have keyword argument `type::Type{T} = Float64` where `T` is the type of the initial guess and the type used by the `NLPModel` API.
* In particular, the initial point `x0` should be a `Vector{T}`, and the `name` keyword should be passed to `ADNLPModel`/`ADNLSModel` with a meaningful problem name.

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

function function_name(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T} 
  # define f (ensure f(x0) is of type T)
 # define x0 (ensure x0 isa Vector{T})
  # nlp = ADNLPModels.ADNLPModel(f, x0, name = "function_name"; kwargs...)
  return nlp
end
```

## Validating new problems

* Ensure all meta fields are accurate and complete, e.g. `:origin`, `:objtype`, and `:name` in [`src/Meta/arglina.jl`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/Meta/arglina.jl).
* Implementations in `ADNLPProblems` and `PureJuMP` must use the same initial point, variable bounds, and constraint bounds; compare `arglina` in [`src/ADNLPProblems/arglina.jl`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/arglina.jl) and [`src/PureJuMP/arglina.jl`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/PureJuMP/arglina.jl).
* The implemented objective function must be callable at the starting point, e.g. `obj(nlp, nlp.meta.x0)` in [`src/ADNLPProblems/lanczos1.jl`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/lanczos1.jl).
* For `ADNLPModels` problems, the objective should return values of type `T` from `type::Type{T}` and the initial point should be typed consistently (`x0::Vector{T}`), for example `Float32` in [`src/ADNLPProblems/brownal.jl`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/brownal.jl).
* Pass a meaningful `name` keyword to `ADNLPModel` constructors, for example `name = "arglina"` in [`src/ADNLPProblems/arglina.jl`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/arglina.jl).
* For constrained problems, ensure in-place constraint evaluations (e.g., `cons_nln!`) are allocation-free, for example the checks in [`test/test-utils.jl`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/test/test-utils.jl).
* Objective function evaluations should have minimal allocations, for example `@allocated obj(nlp, x0)` in the same test style used by [`test/test-utils.jl`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/test/test-utils.jl).
* For variable-size problems, validate at multiple sizes (for example `n = 5`, `n = default_nvar`, and a larger `n`) and check all of the following, e.g. [`arglina`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/arglina.jl) and [`test/test-scalable.jl`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/test/test-scalable.jl):
  - model instantiation succeeds for each tested `n`;
  - effective `nvar` matches the intended rule (including any internal adjustment such as odd `n` or `4k + 3` constraints);
  - if `n` is internally adjusted, the effective value is the closest feasible one to the requested `n`, and a warning is emitted;
  - metadata formulas (`nvar`, `nnzh`, `nnzj`, etc.) match the instantiated model values.
* Optional (recommended): provide a local solver sanity check showing that a standard solver can solve the model from the provided starting point, e.g. `ipopt(arglina())` or `ipopt(lanczos1())`.

```julia
using OptimizationProblems, OptimizationProblems.ADNLPProblems
using NLPModelsIpopt

nlp = problem_name()
stats = ipopt(nlp)
stats.status
```

For least-squares problems, you may also run the same check with `problem_name(use_nls=true)`.

### Nonlinear Least Squares (NLS) Problems

If your problem is a nonlinear least squares (NLS), please follow these guidelines:
* Use `ADNLSModels` for the ADNLPProblems implementation (see [ADNLPModels.jl documentation](https://jso.dev/ADNLPModels.jl/stable/)).
* Set the `:objtype` entry in the meta file to `:least_squares`.
* Add a getter for the number of NLS equations, named `get_problemname_nls_nequ`.
* Support the `use_nls=true/false` keyword to allow both `ADNLPModel` and `ADNLSModel` instantiation from the same problem.
* Instantiate both `ADNLPModel` and `ADNLSModel`, ensure `residual!(nls, x, Fx)` is allocation-free, and check that objectives agree (or differ by a factor of 2 for LS).
* In the `PureJuMP` file, clearly document that the problem is a nonlinear least squares (NLS) problem and explain how users can construct both the standard and NLS variants.
* Explicitly state that the NLS variant can be accessed by passing the keyword argument `use_nls=true` when constructing the problem.
* Make sure this information is also reflected in the meta file, so users and tools can easily discover the NLS capability.
* In validation, also run the local solver sanity check with `problem_name(use_nls=true)`.
See existing NLS problems (e.g., [`lanczos1`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/lanczos1.jl), [`lanczos2`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/lanczos2.jl), [`brownal`](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/brownal.jl)) for templates.

## Reviewer Checklist for New Problems

- [ ] First check: the problem is added in exactly these three files with the same base name: `src/ADNLPProblems/problem_name.jl`, `src/PureJuMP/problem_name.jl`, and `src/Meta/problem_name.jl`.
  Example: [`arglina` in ADNLPProblems](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/ADNLPProblems/arglina.jl), [`arglina` in PureJuMP](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/PureJuMP/arglina.jl), and [`arglina` in Meta](https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/blob/main/src/Meta/arglina.jl).

**Meta**
- [ ] The corresponding meta file exists (`src/Meta/problem_name.jl`), the problem name matches the AD and JuMP files, and `OptimizationProblems.meta` contains the problem entry.
- [ ] All meta fields (origin, objtype, contype, bounds, best-known, etc.) are filled correctly.
- [ ] The problem origin/provenance is clearly documented and consistent between the `PureJuMP` problem documentation and the `:origin` meta entry.
- [ ] Meta formulas for variable sizes match actual model behavior.

**Definition**
- [ ] No extra or spurious exports are introduced.
- [ ] The problem function is exported in `src/ADNLPProblems/problem_name.jl` and `src/PureJuMP/problem_name.jl`, and not exported in `src/Meta/problem_name.jl`.
- [ ] Model name matches the file and function name.
- [ ] The implemented objective, constraints, and bounds match the mathematical problem definition from the cited reference/documentation.

**Implementation**
- [ ] Objective and constraint values agree (ADNLPProblems vs PureJuMP) within tolerance at test points.
- [ ] Number of variables and constraints match.
- [ ] For `type::Type{T}`, `x0 isa Vector{T}` and objective values are of type `T`.
- [ ] `ADNLPModel`/`ADNLSModel` constructors receive a meaningful `name` keyword.

**Sanity**
- [ ] Objective is callable at the starting point and does not return NaN (unless documented).
- [ ] Model instantiates without error for different types, e.g. Float32 and Float64.
- [ ] For scalable problems, changing `n` updates `nvar` and all related meta fields, and the effective number of variables remains as close as possible to the requested `n` when internal adjustments are required.

**Zero-Allocation**
- [ ] All in-place APIs (constraints, residuals) are allocation-free.
- [ ] No unnecessary allocations in tight loops or callbacks.
- [ ] Objective evaluation has minimal allocations (ideally allocation-free in performance-critical paths).

**Least-Squares & In-Place APIs**
- [ ] If least-squares, ADNLP constructor supports `nls=true/false` for both ADNLPModel and ADNLSModel.
- [ ] In-place nonlinear constraint evaluation (`cons_nln!(nlp, x, cx)`) and least-squares residuals (`residual!`) are allocation-free.
- [ ] For least-squares, objectives for NLP and NLS agree (or differ by a factor of 2, as appropriate).
