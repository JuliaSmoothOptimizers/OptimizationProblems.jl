# CLAUDE.md — OptimizationProblems.jl

## Overview

**OptimizationProblems.jl** (v0.9.3) is a Julia package providing ~680+ nonlinear programming (NLP) test problems for benchmarking and developing optimization solvers. It is part of the [JuliaSmoothOptimizers](https://github.com/JuliaSmoothOptimizers) ecosystem and integrates with NLPModels, ADNLPModels, and JuMP.

**Central registry:** `OptimizationProblems.meta` is a `DataFrame` built at load time from `src/Meta/`. It gives instant access to metadata (nvar, ncon, objtype, origin, bounds, feasibility, …) for all problems **without instantiating any model** — extremely useful for filtering and analysis.

```julia
using OptimizationProblems
# Filter unconstrained problems with ≤ 50 variables
df = OptimizationProblems.meta
df[(df.ncon .== 0) .& (df.nvar .≤ 50), :]
```

---

## Repository Structure

```
src/
  OptimizationProblems.jl      # Main module — builds meta DataFrame
  ADNLPProblems/
    ADNLPProblems.jl           # Module loader (lazy, requires ADNLPModels)
    <name>.jl                  # One file per problem
  PureJuMP/
    PureJuMP.jl                # Module loader (always loaded)
    <name>.jl                  # One file per problem
  Meta/
    <name>.jl                  # One metadata file per problem
test/                          # Julia unit test suite
docs/                          # Documenter.jl docs (make.jl, src/)
  src/contributing.md          # Authoritative contributor guidelines
benchmark/                     # BenchmarkTools suite (own Project.toml)
data/                          # .jld2 data files for mesh-heavy problems
```

---

## Three-File Pattern

New problems should provide exactly three files sharing the same base name. (Some existing problems are JuMP-only and lack an `ADNLPProblems` file; a few files also define multiple problems — see `triangle.jl` — but these are legacy exceptions.)

### `src/ADNLPProblems/<name>.jl`

AD-based model. Lazy-loaded (only available when `ADNLPModels` is imported).

```julia
export <name>

function <name>(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  # x0 must be Vector{T}, objective must return type T
  f(x) = ...
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "<name>"; kwargs...)
end
```

### `src/PureJuMP/<name>.jl`

JuMP algebraic model. Always loaded. Short docstring above the function.

```julia
export <name>

"Short description of the problem."
function <name>(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()
  # define variables, constraints, objective
  return nlp
end
```

### `src/Meta/<name>.jl`

Metadata dictionary. Does **not** export the problem function.

```julia
<name>_meta = Dict(
  :nvar                  => 10,
  :variable_nvar         => false,
  :ncon                  => 0,
  :variable_ncon         => false,
  :minimize              => true,
  :name                  => "<name>",
  :has_equalities_only   => false,
  :has_inequalities_only => false,
  :has_bounds            => false,
  :has_fixed_variables   => false,
  :objtype               => :other,       # see valid values below
  :contype               => :unconstrained, # see valid values below
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound =>  Inf,
  :is_feasible           => true,
  :defined_everywhere    => true,
  :origin                => :academic,    # see valid values below
  :implementation        => :both,        # see valid values below
  # Additional fields (branch move-docstring-to-metadata):
  :url            => "https://...",       # must match ^https?://
  :notes          => raw"""""",           # problem description
  :origin_notes   => raw"""""",           # provenance
  :reference      => raw"""@type{key, ...}""", # BibTeX, balanced braces
  :lib            => "CUTEst:NAME",       # library codes, comma-separated
)
```

**Valid values:**
- `:objtype`: `:none`, `:constant`, `:linear`, `:quadratic`, `:sum_of_squares`, `:other`, `:least_squares`
- `:contype`: `:unconstrained`, `:linear`, `:quadratic`, `:general`
- `:origin`: `:academic`, `:modelling`, `:real`, `:unknown`
- `:implementation`: `:both`, `:jump`, `:adnlpmodels`

---

## Scalable Problems

Problems that accept a variable size use `n::Int = default_nvar` (default = 100).

- Adjust invalid `n` to the closest valid value silently with `@warn`, never throw an error. The exact adjustment depends on the problem's constraints on `n` (minimum size, divisibility, parity, etc.).
- Export getter functions for the Meta file: `get_<name>_nvar`, `get_<name>_ncon`, `get_<name>_nlin`, `get_<name>_nnln`, `get_<name>_nequ`, `get_<name>_nineq`
- Reference: `src/ADNLPProblems/arglina.jl`, `src/PureJuMP/arglina.jl`, `src/Meta/arglina.jl`

---

## Nonlinear Least-Squares (NLS) Problems

- Set `:objtype => :least_squares` in the meta file
- Support `use_nls=true/false` keyword: returns `ADNLSModel` or `ADNLPModel`
- Export `get_<name>_nls_nequ`
- `residual!(nls, x, Fx)` must be allocation-free
- Reference: `src/ADNLPProblems/lanczos1.jl`, `src/ADNLPProblems/brownal.jl`

---

## Code Formatting

Uses [JuliaFormatter.jl](https://github.com/domluna/JuliaFormatter.jl). Config is in `.JuliaFormatter.toml`:

| Setting | Value |
|---------|-------|
| `margin` | 100 |
| `indent` | 2 |
| `normalize_line_endings` | `"unix"` |

Format the codebase locally:

```julia
using JuliaFormatter
format(".")
```

---

## Testing

The test suite uses Julia's `Test` stdlib with `Distributed` for parallel execution.

```
julia --project test/runtests.jl
```

Key test files:

| File | Purpose |
|------|---------|
| `test/test-defined-problems.jl` | Verifies all meta entries have working implementations |
| `test/test-scalable.jl` | Validates scalable problem sizing and getter formulas |
| `test/test-in-place-residual.jl` | Allocation checks for NLS residuals |
| `test/utils.jl` | Helpers: `generate_meta()`, `test_multi_precision()` |

**Always test:**
- Multiple sizes for scalable problems: `n = 5`, `n = default_nvar`, large `n`
- Both `Float32` and `Float64`
- Allocation-free in-place APIs (`cons_nln!`, `residual!`)

---

## Good Reference Problems

| Category | Examples |
|----------|---------|
| Unconstrained, scalable | `arwhead`, `arglina` |
| Constrained | `hs100`, `catmix` |
| Least squares (NLS) | `lanczos1`, `brownal` |
| With data files | `catmix`, `rocket` |

---

## Benchmarks

The `benchmark/` directory has its own Julia environment. Run locally:

```
julia benchmark/run_local.jl
```

Benchmarks cover constructor time and objective evaluation for both `ADNLPProblems` and `PureJuMP`, using `BenchmarkTools.jl`.

---

## Full Contributor Guidelines

See [`docs/src/contributing.md`](docs/src/contributing.md) for the complete checklist when adding or modifying problems, including the full reviewer checklist for meta fields, implementation consistency, type stability, and allocation requirements.

---

## Candidate source ingestion

When analyzing a new PDF, paper, benchmark collection, or test-set source:

1. Do not commit PDFs or large raw downloaded files.
2. Use the expected local PDF path:

   ```text
   candidate_sources/<source_slug>/source.pdf
   ```

3. Create or update the following files:

   ```text
   candidate_sources/<source_slug>/README.md
   candidate_sources/<source_slug>/ingestion_report.md
   candidate_sources/<source_slug>/candidate_problems.yml
   candidate_sources/<source_slug>/duplicate_risk_report.md
   candidate_sources/<source_slug>/notes.md
   ```

4. During the ingestion-report step, do not implement optimization problems.

5. Do not invent missing mathematical formulas, data, dimensions, initial points, references, or optimal values.

6. Mark uncertainties explicitly.

7. Propose canonical problem names according to the repository naming conventions.

8. Store original source names as aliases.

9. Before implementation, check duplicate risk against existing problems.

10. Implementation should happen in separate PRs after human review of the candidate list.
