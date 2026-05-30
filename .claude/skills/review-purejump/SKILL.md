---
name: review-purejump
description: Review a src/PureJuMP/<name>.jl file for correctness, signature conventions, n-adjustment, start-value coverage, and cross-compatibility with the ADNLPProblems sibling. Reports findings as Errors (test-suite failures), Warnings (likely issues requiring judgment), and Info (notable but valid observations).
argument-hint: <problem-name>
allowed-tools: [Read, Glob, Grep, Bash]
---

# review-purejump

Audit a single `src/PureJuMP/<name>.jl` file against every rule enforced by the test suite, contributing guidelines, and module-loading conventions.

## Arguments

The user invoked this skill with: $ARGUMENTS

This must be a **problem name** (e.g. `hs100`, `arglina`). Strip a leading `src/PureJuMP/` prefix or trailing `.jl` suffix if present.

If `$ARGUMENTS` is empty after stripping, ask the user to provide a problem name (e.g. `/review-purejump hs100`) and stop — do not try to infer from the open file.

---

## Instructions

Follow these steps in order.

### Step 1 — Read the files

1. Read `src/PureJuMP/<name>.jl` in full.
2. Glob-check whether the sibling files exist:
   - `src/ADNLPProblems/<name>.jl`
   - `src/Meta/<name>.jl`

### Step 2 — Detect problem characteristics from the file text

Before running checks, determine the following from the file content. Do NOT read the sibling files.

- **Is scalable?** — `n` is actually referenced in the function body beyond the signature (used to define variables, constraints, or expressions, not just forwarded).
- **Has n-adjustment?** — the body modifies `n` before using it (e.g. `n = 4 * div(n, 4)`, `n = max(2, n)`).
- **Uses old @warn pattern?** — contains `@warn("` (raw warn call) rather than `@adjust_nvar_warn`.
- **Has nonlinear constraints?** — any `@constraint` (or `@NLconstraint`) with a nonlinear expression involving variables.
- **Has linear constraints?** — any `@constraint` with a purely linear expression involving variables.
- **Has variable bounds?** — any `@variable` with `lb ≤ x ≤ ub` syntax or scalar bound.
- **Multi-function file?** — more than one function name appears in the `export` statement(s), e.g. `export dixmaane, dixmaanf, ...`.
- **Data-loading file?** — calls `_ensure_data!` or `include("../../data/...")`.
- **Has NLS objective?** — `src/Meta/<name>.jl` exists and contains `:objtype => :least_squares`.

### Step 3 — Static analysis

Scan the text of `src/PureJuMP/<name>.jl` and collect findings under three severity levels.

#### Structural (→ Error)

- [ ] The file contains at least one `export` statement.
- [ ] At least one exported symbol matches the filename base `<name>`. This is how `names(PureJuMP)` resolves the problem, and the test `@test setdiff(union(names(PureJuMP), ...), list_problems) == [:PureJuMP]` depends on it.
- [ ] Every symbol listed in `export` is defined as a function in this file. Exporting names from other modules would pollute `PureJuMP`.
- [ ] A function named `<name>` is defined in the file.
- [ ] The file does NOT call `ADNLPModel`, `ADNLPModel!`, `ADNLSModel`, or `ADNLSModel!`. Those constructors belong exclusively in `src/ADNLPProblems/`.
- [ ] The function signature does NOT contain `type::Type{T}` or `where {T}`. Type-parametric dispatch is an ADNLP-only pattern; JuMP handles numeric types internally.
- [ ] `kwargs...` is present as the last keyword argument in every exported function's signature. Without it, callers that forward options will raise an error.
- [ ] The function body creates a `Model()` (or `Model(optimizer)`) and returns it. Returning `nothing`, an NLPModel, or any other type is wrong.
- [ ] The function body contains `@objective`. A JuMP model with no objective is not a valid NLP.

#### Start values (→ Error)

- [ ] Every `@variable` call specifies a `start = ...` value inline, OR the variables are initialized via `set_start_value.(...)` after the macro. Missing start values default to 0.0, which will disagree with the `x0` vector in the ADNLPProblems sibling; the test `nlp_jump.meta.x0 == nlp_ad.meta.x0` will then fail.

  Accepted patterns: `@variable(nlp, x[i=1:n], start = 1.0)`, `@variable(nlp, x[i=1:n], start = x0[i])`, `set_start_value.(x, x0)`.

#### Signature (→ Error)

- [ ] If the problem is scalable (n used in body): `n::Int = default_nvar` must appear as a keyword argument. The default must reference the module constant `default_nvar`, not a raw integer.

#### n-adjustment (→ Error when test is affected, → Warning for soft cases)

- [ ] **Error** — If `n` is adjusted internally such that `get_<name>_nvar(n=50) ≠ 50` or `get_<name>_nvar(n=100) ≠ 100`, the file must use `@adjust_nvar_warn("<name>", n_orig, n)`. The test `test-defined-problems.jl` matches exactly the message emitted by this macro (`"number of variables adjusted from N to M"`). Any other warning format causes the test to fail.
- [ ] **Error** — If `@adjust_nvar_warn` is used, the original requested `n` must be saved first (e.g. `n_orig = n`) before any modification. The first argument to the macro must be the string literal problem name; the second must be the un-modified n; the third must be the adjusted n.
- [ ] **Warning** — If the file uses the old raw `@warn("name: ...")` pattern for a minimum-size guard (e.g. `n < 2 && @warn(...); n = max(2, n)`): this should be replaced by `n_orig = n; n = max(2, n); @adjust_nvar_warn("<name>", n_orig, n)`. It won't cause test failures for n ∈ {50, 100} but is inconsistent with the expected warning format for edge-case inputs.

#### Noteworthy (→ Info)

- [ ] Multi-function file: the `export` statement lists more than one symbol. This is an accepted legacy pattern for function families (dixmaan, genrose+rosenbrock, triangle variants) but new problems should not use it.
- [ ] `n::Int = default_nvar` is present in the signature but `n` is not used in the body. This is harmless but misleading — the keyword will be silently ignored.
- [ ] Data-loading file: calls `_ensure_data!` or `include("../../data/...")`. Correct pattern for mesh/tabular problems; means the problem is effectively non-scalable.
- [ ] `src/ADNLPProblems/<name>.jl` does not exist. This is a JuMP-only problem. Verify it is in the known exclusion list (`catmix`, `gasoil`, `glider`, `methanol`, `minsurf`, `pinene`, `rocket`, `steering`, `torsion`). If it is not in that list, flag as **Warning** — the test suite will fail to find the ADNLPProblems implementation.
- [ ] `src/Meta/<name>.jl` does not exist. Without a meta file the problem is absent from `OptimizationProblems.meta`, and the test `sort(list_problems) == sort(Symbol.(meta[!, :name]))` will fail. This is an **Error**.

### Step 4 — Dynamic analysis (run Julia)

Run the following Julia snippet via the Bash tool. Replace `PROBLEM_NAME` with the actual problem name.

> **Prerequisite:** `NLPModels`, `NLPModelsJuMP`, and `ADNLPModels` must be available. If the snippet fails with a package-not-found error, install them first:
> ```
> julia -e "import Pkg; Pkg.add([\"NLPModels\", \"NLPModelsJuMP\", \"ADNLPModels\"])"
> ```

```bash
julia --project -e "
using OptimizationProblems, NLPModels
import OptimizationProblems.PureJuMP, OptimizationProblems.ADNLPProblems
import NLPModelsJuMP, ADNLPModels

name = \"PROBLEM_NAME\"

if !(Symbol(name) in names(PureJuMP, all=false))
  println(\"FAIL export: \", name, \" not exported from PureJuMP\")
  exit(0)
end
ctor = PureJuMP.eval(Symbol(name))
println(\"OK export\")

# --- Instantiation ---
model = nothing
try
  global model = ctor()
  println(\"OK instantiate_model\")
catch e
  println(\"FAIL instantiate_model: \", e)
end
model === nothing && exit(0)

nlp = nothing
try
  global nlp = NLPModelsJuMP.MathOptNLPModel(model)
  println(\"OK wrap_nlpmodel\")
catch e
  println(\"FAIL wrap_nlpmodel: \", e)
end
nlp === nothing && exit(0)

# --- Objective at x0 ---
f0 = try obj(nlp, nlp.meta.x0) catch e; println(\"FAIL obj_at_x0: \", e); NaN end
if !isnan(f0)
  println(isfinite(f0) ? \"OK obj_at_x0: \$(f0)\" : \"WARN obj_at_x0: non-finite value \$(f0)\")
end

# --- Meta consistency ---
has_meta = isdefined(OptimizationProblems, Symbol(name, :_meta))
if !has_meta
  println(\"INFO no_meta: src/Meta/$(name).jl not loaded\")
else
  meta = OptimizationProblems.eval(Symbol(name, :_meta))
  get_pb_nvar  = OptimizationProblems.eval(Symbol(:get_, name, :_nvar))
  get_pb_ncon  = OptimizationProblems.eval(Symbol(:get_, name, :_ncon))
  get_pb_nlin  = OptimizationProblems.eval(Symbol(:get_, name, :_nlin))
  get_pb_nnln  = OptimizationProblems.eval(Symbol(:get_, name, :_nnln))
  get_pb_nequ  = OptimizationProblems.eval(Symbol(:get_, name, :_nequ))
  get_pb_nineq = OptimizationProblems.eval(Symbol(:get_, name, :_nineq))

  actual_nequ = length(get_jfix(nlp))

  checks = [
    (\"meta_nvar\",             meta[:nvar],                  nlp.meta.nvar,
      meta[:nvar] == nlp.meta.nvar || meta[:variable_nvar]),
    (\"meta_ncon\",             meta[:ncon],                  nlp.meta.ncon,
      meta[:ncon] == nlp.meta.ncon || meta[:variable_ncon]),
    (\"minimize\",              meta[:minimize],              get_minimize(nlp),
      meta[:minimize] == get_minimize(nlp)),
    (\"has_bounds\",            meta[:has_bounds],            length(get_ifree(nlp)) < get_nvar(nlp),
      meta[:has_bounds] == (length(get_ifree(nlp)) < get_nvar(nlp))),
    (\"has_fixed_variables\",   meta[:has_fixed_variables],   get_ifix(nlp) != [],
      meta[:has_fixed_variables] == (get_ifix(nlp) != [])),
    (\"has_equalities_only\",   meta[:has_equalities_only],   actual_nequ == get_ncon(nlp) > 0,
      meta[:has_equalities_only] == (actual_nequ == get_ncon(nlp) > 0)),
    (\"has_inequalities_only\", meta[:has_inequalities_only], get_ncon(nlp) > 0 && actual_nequ == 0,
      meta[:has_inequalities_only] == (get_ncon(nlp) > 0 && actual_nequ == 0)),
    (\"getter_nvar\",           get_pb_nvar(),                nlp.meta.nvar,
      get_pb_nvar()  == nlp.meta.nvar  || meta[:variable_nvar]),
    (\"getter_ncon\",           get_pb_ncon(),                nlp.meta.ncon,
      get_pb_ncon()  == nlp.meta.ncon  || meta[:variable_ncon]),
    (\"getter_nlin\",           get_pb_nlin(),                nlp.meta.nlin,
      get_pb_nlin()  == nlp.meta.nlin  || meta[:variable_ncon]),
    (\"getter_nnln\",           get_pb_nnln(),                nlp.meta.nnln,
      get_pb_nnln()  == nlp.meta.nnln  || meta[:variable_ncon]),
    (\"getter_nequ\",           get_pb_nequ(),                actual_nequ,
      get_pb_nequ()  == actual_nequ    || meta[:variable_ncon]),
    (\"getter_nineq\",          get_pb_nineq(),               nlp.meta.ncon - actual_nequ,
      get_pb_nineq() == (nlp.meta.ncon - actual_nequ) || meta[:variable_ncon]),
  ]

  for (label, meta_val, actual_val, ok) in checks
    println(ok ? \"OK\" : \"FAIL\", \" \", label, \": meta=\", meta_val, \" actual=\", actual_val)
  end

  println(\"DEFINED_EVERYWHERE_CHECK finite=\", isfinite(f0), \" meta=\", meta[:defined_everywhere])

  # --- Scalability check ---
  if meta[:variable_nvar]
    n_test = 5
    try
      model2 = ctor(n = n_test)
      nlp2 = NLPModelsJuMP.MathOptNLPModel(model2)
      n_expected = get_pb_nvar(n = n_test)
      ok = nlp2.meta.nvar == n_expected
      println(ok ? \"OK scalable_nvar: \$(nlp2.meta.nvar)\" : \"FAIL scalable_nvar: got \$(nlp2.meta.nvar) expected \$(n_expected)\")
      println(nlp2.meta.nvar != nlp.meta.nvar ? \"OK scalable_changes\" : \"WARN scalable_no_change: both n give nvar=\$(nlp.meta.nvar)\")
    catch e
      println(\"FAIL scalable_instantiate: \", e)
    end
  end
end

# --- Compatibility with ADNLPProblems ---
if Symbol(name) in names(ADNLPProblems, all=false)
  ad_ctor = ADNLPProblems.eval(Symbol(name))
  nlp_ad = nothing
  try
    global nlp_ad = ad_ctor()
    println(\"OK ad_instantiate\")
  catch e
    println(\"WARN ad_instantiate: \", e)
  end

  if nlp_ad !== nothing
    println(nlp.meta.nvar == nlp_ad.meta.nvar ? \"OK compat_nvar\" :
      \"FAIL compat_nvar: jump=\$(nlp.meta.nvar) ad=\$(nlp_ad.meta.nvar)\")
    println(nlp.meta.ncon == nlp_ad.meta.ncon ? \"OK compat_ncon\" :
      \"FAIL compat_ncon: jump=\$(nlp.meta.ncon) ad=\$(nlp_ad.meta.ncon)\")
    println(nlp.meta.x0 == nlp_ad.meta.x0 ? \"OK compat_x0\" :
      \"FAIL compat_x0: starting points differ\")
    println(nlp.meta.lvar == nlp_ad.meta.lvar ? \"OK compat_lvar\" :
      \"FAIL compat_lvar: lower bounds differ\")
    println(nlp.meta.uvar == nlp_ad.meta.uvar ? \"OK compat_uvar\" :
      \"FAIL compat_uvar: upper bounds differ\")

    x0 = nlp_ad.meta.x0
    x1 = x0 .+ 0.01
    f_jump = try obj(nlp, x0)    catch; NaN end
    f_ad   = try obj(nlp_ad, x0) catch; NaN end
    if !isnan(f_jump) && !isnan(f_ad)
      n0 = max(abs(f_ad), 1.0)
      println(isapprox(f_jump, f_ad, atol=1e-10*n0) ? \"OK compat_obj_x0\" :
        \"FAIL compat_obj_x0: jump=\$(f_jump) ad=\$(f_ad)\")
      f_jump1 = try obj(nlp, x1)    catch; NaN end
      f_ad1   = try obj(nlp_ad, x1) catch; NaN end
      if !isnan(f_jump1) && !isnan(f_ad1)
        n1 = max(abs(f_ad1), 1.0)
        println(isapprox(f_jump1, f_ad1, atol=1e-10*n1) ? \"OK compat_obj_x1\" :
          \"FAIL compat_obj_x1: jump=\$(f_jump1) ad=\$(f_ad1)\")
      end
    end

    if nlp_ad.meta.ncon > 0
      c_jump = try cons(nlp, x0)    catch; nothing end
      c_ad   = try cons(nlp_ad, x0) catch; nothing end
      if c_jump !== nothing && c_ad !== nothing
        n0 = max(maximum(abs.(c_ad .+ 1e-30)), 1.0)
        println(all(isapprox.(c_jump, c_ad, atol=1e-10*n0)) ? \"OK compat_cons_x0\" :
          \"FAIL compat_cons_x0: constraint values differ at x0\")
        c_jump1 = try cons(nlp, x1)    catch; nothing end
        c_ad1   = try cons(nlp_ad, x1) catch; nothing end
        if c_jump1 !== nothing && c_ad1 !== nothing
          n1 = max(maximum(abs.(c_ad1 .+ 1e-30)), 1.0)
          println(all(isapprox.(c_jump1, c_ad1, atol=1e-10*n1)) ? \"OK compat_cons_x1\" :
            \"FAIL compat_cons_x1: constraint values differ at x0+0.01\")
        end
        println(nlp.meta.lcon ≈ nlp_ad.meta.lcon ? \"OK compat_lcon\" :
          \"FAIL compat_lcon: lower constraint bounds differ\")
        println(nlp.meta.ucon ≈ nlp_ad.meta.ucon ? \"OK compat_ucon\" :
          \"FAIL compat_ucon: upper constraint bounds differ\")
        println(nlp.meta.lin == nlp_ad.meta.lin ? \"OK compat_lin\" :
          \"FAIL compat_lin: linear constraint index sets differ\")
      end
    end
  end
else
  println(\"INFO no_ad_sibling\")
end
"
```

Interpret the output as follows:

| Line pattern | Action |
|---|---|
| `OK export` | No finding |
| `FAIL export: ...` | Error: function not exported from PureJuMP |
| `OK instantiate_model` | No finding |
| `FAIL instantiate_model: ...` | Error: JuMP model construction throws; all subsequent dynamic checks skipped |
| `OK wrap_nlpmodel` | No finding |
| `FAIL wrap_nlpmodel: ...` | Error: `MathOptNLPModel` wrapping fails |
| `OK obj_at_x0: X` | No finding |
| `FAIL obj_at_x0: ...` | Error: objective throws at starting point |
| `WARN obj_at_x0: non-finite value X` | Warning: objective is `Inf` or `-Inf` at `x0` |
| `INFO no_meta: ...` | Info: `src/Meta/<name>.jl` not present; meta-consistency checks skipped |
| `OK <field>: meta=X actual=Y` | No finding |
| `FAIL <field>: meta=X actual=Y` | Error: meta field `<field>` claims `X` but the JuMP model gives `Y` |
| `DEFINED_EVERYWHERE_CHECK finite=false meta=true` | Warning: objective is NaN/Inf at x0 but `:defined_everywhere => true` |
| `DEFINED_EVERYWHERE_CHECK finite=false meta=missing` | Warning: objective is NaN/Inf at x0; `:defined_everywhere` should probably be `false` |
| `DEFINED_EVERYWHERE_CHECK finite=false meta=false` | Info: consistent — domain is declared restricted and x0 confirms it |
| `DEFINED_EVERYWHERE_CHECK finite=true ...` | No finding |
| `OK scalable_nvar: N` | No finding |
| `FAIL scalable_nvar: got N expected M` | Error: `nvar` at `n=5` does not match `get_<name>_nvar(n=5)` |
| `OK scalable_changes` | No finding |
| `WARN scalable_no_change: ...` | Warning: meta says `variable_nvar=true` but both n values give the same `nvar` |
| `FAIL scalable_instantiate: ...` | Error: model cannot be instantiated at small `n` |
| `OK ad_instantiate` | No finding; note in report that compatibility was tested |
| `WARN ad_instantiate: ...` | Warning: ADNLPProblems sibling exists but cannot be instantiated |
| `OK compat_nvar` / `FAIL compat_nvar: ...` | Match/mismatch in number of variables between JuMP and AD models |
| `OK compat_ncon` / `FAIL compat_ncon: ...` | Match/mismatch in number of constraints |
| `OK compat_x0` / `FAIL compat_x0: ...` | Error: starting points disagree — `x0` in `@variable start=...` differs from AD `x0` |
| `OK compat_lvar` / `FAIL compat_lvar: ...` | Error: variable lower bounds disagree |
| `OK compat_uvar` / `FAIL compat_uvar: ...` | Error: variable upper bounds disagree |
| `OK compat_obj_x0` / `FAIL compat_obj_x0: ...` | Error: objective values at `x0` disagree |
| `OK compat_obj_x1` / `FAIL compat_obj_x1: ...` | Error: objective values at `x0+0.01` disagree |
| `OK compat_cons_x0` / `FAIL compat_cons_x0: ...` | Error: constraint values at `x0` disagree |
| `OK compat_cons_x1` / `FAIL compat_cons_x1: ...` | Error: constraint values at `x0+0.01` disagree |
| `OK compat_lcon` / `FAIL compat_lcon: ...` | Error: constraint lower bounds disagree |
| `OK compat_ucon` / `FAIL compat_ucon: ...` | Error: constraint upper bounds disagree |
| `OK compat_lin` / `FAIL compat_lin: ...` | Error: linear constraint index sets disagree |
| `INFO no_ad_sibling` | Info: no `ADNLPProblems` sibling — JuMP-only problem; no compatibility checks run |

### Step 5 — Report

Output:

```
## review-purejump: <name>   [src/PureJuMP/<name>.jl]
Characteristics: <scalable|fixed-size>, <unconstrained|linear|nonlinear|mixed>, <with bounds|no bounds>
Dynamic checks: <passed | N failures | not available>
Compatibility: <tested against ADNLPProblems | JuMP-only problem | AD sibling not instantiatable>

### Errors (N)
- [E] <check>: <what was wrong and what was expected>

### Warnings (N)
- [W] <check>: <what is missing or suspicious>

### Info (N)
- [I] <observation>: <what was noted>

---
Summary: N error(s), N warning(s), N info.
```

If a tier has zero findings, omit that section header entirely. End with one sentence summarising the overall state.

---

## Quick reference

### Standard signature forms

| Problem type | Signature |
|---|---|
| Scalable, unconstrained | `function <name>(args...; n::Int = default_nvar, kwargs...)` |
| Fixed-size | `function <name>(args...; kwargs...)` |
| Scalable with extra params | `function <name>(args...; n::Int = default_nvar, α::Float64 = 1.0, kwargs...)` |

### n-adjustment pattern (required form)

```julia
function <name>(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = 4 * max(1, div(n, 4))   # or whatever the adjustment is
  @adjust_nvar_warn("<name>", n_orig, n)
  ...
end
```

### @variable start value patterns (all accepted)

```julia
@variable(nlp, x[i = 1:n], start = 1.0)          # scalar literal
@variable(nlp, x[i = 1:n], start = x0[i])         # per-element from array
@variable(nlp, 0 <= x[i = 1:n] <= 1, start = 0.5) # bounded with start
set_start_value.(x, x0)                            # post-hoc batch assignment
```

### Reference examples

- Unconstrained scalable: `src/PureJuMP/arwhead.jl`
- Scalable with n-adjustment: `src/PureJuMP/woods.jl`, `src/PureJuMP/elec.jl`
- Scalable multi-parameter family: `src/PureJuMP/dixmaan_efgh.jl`
- Constrained scalable: `src/PureJuMP/elec.jl`, `src/PureJuMP/catmix.jl`
- Fixed-size constrained: `src/PureJuMP/hs100.jl`
- Data-loading with `_ensure_data!`: `src/PureJuMP/triangle.jl`
