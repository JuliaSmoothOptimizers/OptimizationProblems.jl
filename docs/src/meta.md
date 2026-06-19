# OptimizationProblems.jl problem classification

It is possible to access information on the problems implemented in `OptimizationProblems.jl` without loading the problems using the package's own classification.
​
```@example 1
using OptimizationProblems
```

Each problem has its own metadata structure, and there is a global metadata structure regrouping all the information.

## Problem's metadata

Each problem's metadata is accessible with `OptimizationProblems.nameoftheproblem_meta` and regroups in a `Dict` most of the essential information regarding each problem.

```@example 1
OptimizationProblems.AMPGO02_meta
```
See `? OptimizationProblems.meta` for more documentation on the various entries and their default values.

This structure is completed by getters to access the number of variables, `get_nameoftheproblem_nvar`, the number of constraints, `get_nameoftheproblem_ncon`, the number of linear constraints, `get_nameoftheproblem_nlin`, the number of nonlinear constraints, `get_nameoftheproblem_nnln`, the number of equality constraints, `get_nameoftheproblem_nequ`, and the number of inequality constraints, `get_nameoftheproblem_nineq`.
```@example 1
OptimizationProblems.get_AMPGO02_nvar()
```
For scalable problems the entry `:variable_nvar` (and/or `:variable_ncon`) is set as true and one can access the number of variables by passing the parameters to the getter functions. By default, the number of variables set in the meta is obtained using `OptimizationProblems.default_nvar` as a parameter to define the problem.
```@example 1
OptimizationProblems.arglina_meta
```
```@example 1
OptimizationProblems.get_arglina_nvar(n = 10)
```
```@example 1
OptimizationProblems.PureJuMP.arglina(n = 10)
```

## Global meta

This package collects all the metadata in a single [`DataFrame`](https://github.com/JuliaData/DataFrames.jl).
```@example 1
OptimizationProblems.meta
```
Then, it is very simple to filter problems using queries on `DataFrame`. We refer to the documentation of [DataFrames.jl](https://dataframes.juliadata.org/stable/) for tutorials. For instance, if one wants to select unconstrained scalable problems and use `(:nvar, :name)`.
```@example 1
meta = OptimizationProblems.meta
names_pb_vars = meta[(meta.variable_nvar .== true) .& (meta.ncon .== 0), [:nvar, :name]]
```
Then, one can prepare a list of problems using the selected ones.
```@example 1
using ADNLPModels
adproblems = (
  eval(Meta.parse("ADNLPProblems.$(pb[:name])()")) for pb in eachrow(names_pb_vars)
)
```

### Nonlinear Least Squares Problems (NLS) 
Problems with `:objtype` set to `:least_squares` are nonlinear least squares problems (NLS). For these, you can access the number of NLS equations using a getter like `get_nameoftheproblem_nls_nequ()`.
```@example 1
OptimizationProblems.get_lanczos1_nls_nequ()
```
To filter all NLS problems in the metadata DataFrame:
```@example 1
nls_problems = OptimizationProblems.meta[OptimizationProblems.meta.objtype .== :least_squares, :name]
```

### Test-set membership (`:lib`)

The `:lib` column records membership in named optimization test-set collections.
Each entry is a comma-separated list of `"Collection:ID"` pairs; an empty string
means the problem has no known test-set membership.

```@example 1
OptimizationProblems.hs1_meta[:lib]  # "CUTEst:HS1, HS:1"
```

Known collections (keys of `OptimizationProblems.LIB_REFERENCES`):

| Key | Description |
|-----|-------------|
| `AMPGO` | Gavana's Global Optimization benchmark suite |
| `COPS` | COPS 3.0 collection (Dolan & Moré, 2004) |
| `CUTEst` | CUTEst testing environment (Gould et al., 2015) |
| `HS` | Hock & Schittkowski (1981), Vol. 187 |
| `HS2` | Schittkowski (1987), Vol. 282 |
| `Luksan` | Luksan, Matonoha & Vlček (2003) — Modified CUTE problems |
| `LuksanSparse` | Luksan, Matonoha & Vlček (2010) — Sparse test problems |
| `MGH` | Moré, Garbow & Hillstrom (1981) |
| `NIST` | NIST/ITL Statistical Reference Datasets |

To filter by collection, use Julia's `contains` function:

```@example 1
meta = OptimizationProblems.meta
cops_problems = meta[contains.(meta.lib, "COPS"), [:name, :lib]]
```

```@example 1
cutest_problems = meta[contains.(meta.lib, "CUTEst"), [:name, :lib]]
```

`OptimizationProblems.LIB_REFERENCES` provides the canonical BibTeX entry for
each collection, and [`export_bibtex`](@ref) automatically appends them when
`include_lib_refs = true` (the default).

## Problem source information

The following code will create a .bib file regrouping all the BibTex citations.
```julia
using OptimizationProblems
export_bibtex()
```
Fields documenting the origin of the problem may be incomplete and any help is welcome.
