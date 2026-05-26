---
name: review-adnlpproblems
description: Review a src/ADNLPProblems/<name>.jl file for correctness, type stability, constructor form, and allocation requirements. Reports findings as Errors (test-suite failures or type bugs), Warnings (likely issues requiring judgment), and Info (notable but valid observations).
argument-hint: <problem-name>
allowed-tools: [Read, Glob, Grep, Bash]
---

# review-adnlpproblems

Audit a single `src/ADNLPProblems/<name>.jl` file against every rule enforced by the test suite, contributing guidelines, and ADNLPModels API conventions.

## Arguments

The user invoked this skill with: $ARGUMENTS

This must be a **problem name** (e.g. `hs1`, `arglina`). Strip a leading `src/ADNLPProblems/` prefix or trailing `.jl` suffix if present.

If `$ARGUMENTS` is empty after stripping, ask the user to provide a problem name (e.g. `/review-adnlpproblems hs100`) and stop.

---

## Instructions

Follow these steps in order.

### Step 1 — Read the files

1. Read `src/ADNLPProblems/<name>.jl` in full.
2. Glob-check whether the sibling files exist:
   - `src/PureJuMP/<name>.jl`
   - `src/Meta/<name>.jl`

### Step 2 — Detect problem characteristics from the file text

Before running checks, determine the following from the file content. Do NOT read the meta file.

- **Is NLS?** — `use_nls::Bool` appears in a function signature, or `ADNLSModel!` is called.
- **Has nonlinear constraints?** — a function `c!(cx, x)` or `function c!` is defined in the file.
- **Has linear constraints?** — `clinrows`, `clincols`, `clinvals` appear, or a `SparseMatrixCSC` / `spzeros` / `sparse(` / `spdiagm` is passed directly to the constructor (not only used inside `c!`).
- **Has variable bounds?** — `lvar` and `uvar` are defined and passed to the constructor.
- **Is scalable?** — `n` is actually used in the function body (beyond just accepting it as a keyword argument that is never referenced).
- **Has n-adjustment?** — the body modifies `n` before using it (e.g., `n = 2 * div(n, 2)` or `n = max(2, n)`).

### Step 3 — Static analysis

Scan the text of `src/ADNLPProblems/<name>.jl` and collect findings.

#### Structural (→ Error)

- [ ] The file contains `export <name>` exactly once, where `<name>` matches the filename base.
- [ ] No other `export` statements appear in the file.
- [ ] At least one function is named `<name>` (matches filename base).
- [ ] **NLS dispatch pattern** (only if NLS detected): the file defines all three of:
  1. `function <name>(; use_nls::Bool = false, kwargs...)` — dispatcher
  2. `function <name>(::Val{:nlp}; ...)` — NLP variant
  3. `function <name>(::Val{:nls}; ...)` — NLS variant

  If NLS is not detected, none of these three are required, but if `Val{:nlp}` or `Val{:nls}` appear without the full triple, that is an Error.

#### Signature (→ Error)

Check each substantive method (the NLP function, or the `Val{:nlp}` / `Val{:nls}` methods, not the dispatcher):

- [ ] `n::Int = default_nvar` is present as a keyword argument.
- [ ] `type::Type{T} = Float64` is present as a keyword argument.
- [ ] `kwargs...` is the last keyword argument.
- [ ] The function is declared `where {T}`.

#### Constructor (→ Error)

- [ ] Every constructor call passes `name = "<name>"` for the NLP variant.
- [ ] Every NLS constructor call passes `name = "<name>-nls"` (i.e. the problem name with `-nls` appended).
- [ ] Every constructor call ends with `; kwargs...)` (the `kwargs...` are forwarded).
- [ ] **`!`-suffix consistency:**
  - If nonlinear constraints are present (`c!` defined): constructor must be `ADNLPModel!` (not `ADNLPModel`).
  - If no nonlinear constraints: constructor must NOT be `ADNLPModel!` for the `c!`-free form. (Using `ADNLPModel` for bounds-only or linear-only is correct.)
  - NLS constructor must always be `ADNLSModel!` (always in-place).

#### Type stability (→ Error, from dynamic checks only)

Type stability issues — whether `x0`, `lvar`/`uvar`, `lcon`/`ucon`, `clinvals`, or objective return type are bound to `T` — **must be verified dynamically** (Step 4), not by static pattern matching. Static analysis cannot reliably detect indirect assignments (`x0 = some_var` where `some_var` was built with `T` elsewhere, or two-step patterns like `x0 = data; x0 = T.(x0)`).

Do not report type annotation findings from static analysis as errors. Rely exclusively on:
- `FAIL x0_eltype_f32` → `x0` element type is not `Float32`
- `FAIL obj_type_f32` → objective returns wrong type
- `FAIL cons_eltype_f32` → constraint values have wrong type
- `FAIL instantiate_f32` → model cannot be built at all with `Float32`

#### n-adjustment (→ Error)

- [ ] If the body modifies `n` (has n-adjustment), `@adjust_nvar_warn` is called with the problem name as a string literal and the original and adjusted `n`. Signature: `@adjust_nvar_warn("<name>", n_orig, n)`.
- [ ] If the body modifies `n`, the original value is saved first (e.g., `n_org = n`) so the macro can compare them.

#### Objective type stability (→ Warning)

- [ ] Unguarded float literals in the **objective function body** (the closure `f(x) = ...` or `function f(x)`): literals like `0.5`, `2.0`, `1.0` mixed with `x` arithmetic cause the return type to be Float64 regardless of `T`. Flag each occurrence. Accepted alternatives: rational literals (`1//2`, `2//1`), or explicit conversion (`T(0.5)` defined before the closure).

  Note: float literals in **data arrays defined outside the closure** (e.g., a `y` matrix of observations) are acceptable if that array is not of type `T`. Float literals inside `T[...]` constructors are fine.

#### Documentation (→ Warning)

- [ ] The file has no docstring or comment describing the problem. PureJuMP carries the docstring; ADNLPProblems does not need one. This is Info, not a Warning.

### Step 4 — Dynamic analysis (run Julia)

Run the following Julia snippet via the Bash tool. Replace `PROBLEM_NAME` with the actual problem name.

> **Prerequisite:** `NLPModels` and `ADNLPModels` must be available. If the snippet fails with a package-not-found error, install them first:
> ```
> julia -e "import Pkg; Pkg.add([\"NLPModels\", \"ADNLPModels\"])"
> ```

```bash
julia --project -e "
using OptimizationProblems, NLPModels
import OptimizationProblems.ADNLPProblems, ADNLPModels

name = \"PROBLEM_NAME\"
ctor = nothing

if !(Symbol(name) in names(ADNLPProblems, all=false))
  println(\"FAIL export: \", name, \" not exported from ADNLPProblems\")
  exit(0)
end
ctor = ADNLPProblems.eval(Symbol(name))
println(\"OK export\")

# --- Float64 instantiation ---
nlp = nothing
try
  global nlp = ctor()
  println(\"OK instantiate_f64\")
catch e
  println(\"FAIL instantiate_f64: \", e)
end
nlp === nothing && exit(0)

# --- Name ---
println(nlp.meta.name == name ? \"OK name\" : \"FAIL name: got \$(nlp.meta.name)\")

# --- Objective at x0 ---
f0 = try obj(nlp, nlp.meta.x0) catch e; println(\"FAIL obj_at_x0: \", e); NaN end
if !isnan(f0)
  println(isfinite(f0) ? \"OK obj_at_x0: \$(f0)\" : \"WARN obj_at_x0: non-finite value \$(f0)\")
end

# --- Float32 type stability ---
nlp32 = nothing
try
  global nlp32 = ctor(type = Float32)
  println(\"OK instantiate_f32\")
catch e
  println(\"FAIL instantiate_f32: \", e)
end

if nlp32 !== nothing
  x0_32 = nlp32.meta.x0
  println(eltype(x0_32) == Float32 ? \"OK x0_eltype_f32\" : \"FAIL x0_eltype_f32: \$(eltype(x0_32))\")
  f32 = try obj(nlp32, x0_32) catch e; println(\"FAIL obj_f32: \", e); nothing end
  if f32 !== nothing
    println(typeof(f32) == Float32 ? \"OK obj_type_f32\" : \"FAIL obj_type_f32: \$(typeof(f32))\")
  end
  if nlp32.meta.ncon > 0
    c32 = try cons(nlp32, x0_32) catch e; println(\"FAIL cons_f32: \", e); nothing end
    if c32 !== nothing
      println(eltype(c32) == Float32 ? \"OK cons_eltype_f32\" : \"FAIL cons_eltype_f32: \$(eltype(c32))\")
    end
  end
end

# --- Allocation-free cons_nln! ---
if nlp.meta.nnln > 0 && nlp isa ADNLPModels.AbstractADNLPModel
  x = nlp.meta.x0; cx = similar(x, nlp.meta.nnln)
  try
    cons_nln!(nlp, x, cx)
    alloc = @allocated cons_nln!(nlp, x, cx)
    println(alloc == 0 ? \"OK cons_nln_alloc\" : \"FAIL cons_nln_alloc: \$(alloc) bytes\")
  catch e
    println(\"FAIL cons_nln_eval: \", e)
  end
end

# --- NLS checks ---
try
  nls = ctor(use_nls = true)
  if !(nls isa NLPModels.AbstractNLSModel)
    println(\"INFO nls_not_supported\")
  else
  println(\"OK nls_dispatch\")
  println(nls.meta.name == name * \"-nls\" ? \"OK nls_name\" : \"FAIL nls_name: got \$(nls.meta.name)\")
  println(nlp.meta.x0 == nls.meta.x0 ? \"OK nls_x0_matches\" : \"FAIL nls_x0_matches\")
  x = nls.meta.x0; Fx = similar(x, nls.nls_meta.nequ)
  try
    residual!(nls, x, Fx)
    alloc = @allocated residual!(nls, x, Fx)
    println(alloc == 0 ? \"OK residual_alloc\" : \"FAIL residual_alloc: \$(alloc) bytes\")
  catch e
    println(\"FAIL residual_eval: \", e)
  end
  nlp_obj = try obj(nlp, nlp.meta.x0) catch; NaN end
  nls_obj = try obj(nls, nls.meta.x0) catch; NaN end
  if !isnan(nlp_obj) && !isnan(nls_obj)
    ok = isapprox(nlp_obj, nls_obj, rtol=1e-8) || isapprox(nlp_obj, 2*nls_obj, rtol=1e-8)
    println(ok ? \"OK nls_nlp_obj_agree\" : \"FAIL nls_nlp_obj_agree: nlp=\$(nlp_obj) nls=\$(nls_obj)\")
  end
  end # else
catch e
  println(\"INFO nls_not_supported\")
end
"
```

Interpret the output:

| Line pattern | Action |
|---|---|
| `OK export` | No finding |
| `FAIL export: ...` | Error: function not exported from ADNLPProblems |
| `OK instantiate_f64` | No finding |
| `FAIL instantiate_f64: ...` | Error: model cannot be instantiated; all subsequent dynamic checks skipped |
| `OK name` | No finding |
| `FAIL name: got X` | Error: `name` keyword in constructor is `X`, expected `"<name>"` |
| `OK obj_at_x0: X` | No finding |
| `FAIL obj_at_x0: ...` | Error: objective throws at starting point |
| `WARN obj_at_x0: non-finite value X` | Warning: objective is `Inf` or `-Inf` at `x0` |
| `OK instantiate_f32` | No finding |
| `FAIL instantiate_f32: ...` | Error: model cannot be instantiated with `type = Float32`; type stability checks skipped |
| `OK x0_eltype_f32` | No finding |
| `FAIL x0_eltype_f32: X` | Error: `x0` has element type `X` instead of `Float32` — `x0` not typed with `T` |
| `OK obj_type_f32` | No finding |
| `FAIL obj_type_f32: X` | Error: objective returns `X` instead of `Float32` — float literal in objective body |
| `OK cons_eltype_f32` | No finding |
| `FAIL cons_eltype_f32: X` | Error: constraint values have element type `X` instead of `Float32` |
| `OK cons_nln_alloc` | No finding |
| `FAIL cons_nln_alloc: N bytes` | Error: `cons_nln!` allocates `N` bytes — constraint closure is not allocation-free |
| `FAIL cons_nln_eval: ...` | Error: `cons_nln!` throws |
| `OK nls_dispatch` | No finding; note in report that NLS is supported |
| `FAIL nls_name: got X` | Error: NLS variant passes wrong `name` keyword |
| `FAIL nls_x0_matches` | Error: NLS and NLP starting points differ |
| `OK residual_alloc` | No finding |
| `FAIL residual_alloc: N bytes` | Error: `residual!` allocates `N` bytes — residual closure is not allocation-free |
| `FAIL residual_eval: ...` | Error: `residual!` throws |
| `OK nls_nlp_obj_agree` | No finding |
| `FAIL nls_nlp_obj_agree: nlp=X nls=Y` | Error: NLP and NLS objectives disagree at `x0` (neither equal nor in 2:1 ratio) |
| `INFO nls_not_supported` | Info: `use_nls = true` not accepted — problem has no NLS variant |

### Step 5 — Report

Output:

```
## review-adnlpproblems: <name>   [src/ADNLPProblems/<name>.jl]
Characteristics: <scalable|fixed-size>, <unconstrained|linear|nonlinear|mixed>, <NLS|NLP>
Dynamic checks: <passed | N failures>

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

### Accepted `x0` construction patterns (type-stable)
`ones(T, n)` · `zeros(T, n)` · `fill(-one(T), n)` · `T[1.2, 0.3]` · `1//2 * ones(T, n)` · `convert.(T, arr)`

### Constructor selection

| Constraint type | Constructor |
|---|---|
| None | `ADNLPModel(f, x0, name=...; kwargs...)` |
| Bounds only | `ADNLPModel(f, x0, lvar, uvar, name=...; kwargs...)` |
| Linear only | `ADNLPModel(f, x0, [lvar, uvar,] clinrows, clincols, clinvals, lcon, ucon, name=...; kwargs...)` |
| Nonlinear only | `ADNLPModel!(f, x0, [lvar, uvar,] c!, lcon, ucon, name=...; kwargs...)` |
| Mixed | `ADNLPModel!(f, x0, [lvar, uvar,] clinrows, clincols, clinvals, c!, lcon, ucon, name=...; kwargs...)` |
| NLS | `ADNLSModel!(F!, x0, nequ, [lvar, uvar, c!, lcon, ucon,] name=...; kwargs...)` |

**Ordering in `lcon`/`ucon` for mixed problems:** linear constraint bounds first (rows of `A`), then nonlinear constraint bounds (entries filled by `c!`).

### Reference examples
- Unconstrained scalable: `src/ADNLPProblems/arwhead.jl`
- Unconstrained scalable NLS: `src/ADNLPProblems/arglina.jl`
- Nonlinear constraints: `src/ADNLPProblems/hs100.jl`
- Linear constraints only: `src/ADNLPProblems/hs118.jl`
- Mixed linear + nonlinear + bounds: `src/ADNLPProblems/controlinvestment.jl`
- Mixed with sparse matrix A: `src/ADNLPProblems/chain.jl`
- n-adjustment with `@adjust_nvar_warn`: `src/ADNLPProblems/woods.jl`
