---
name: review-meta
description: Review a src/Meta/<name>.jl file for correctness, completeness, and consistency with the problem implementation. Reports findings as Errors (test-suite failures), Warnings (documentation gaps), and Info (notable but valid).
argument-hint: <problem-name>
allowed-tools: [Read, Glob, Grep, Bash]
---

# review-meta

Audit a single `src/Meta/<name>.jl` file against every rule enforced by tests, contributing guidelines, and module-loading logic.

## Arguments

The user invoked this skill with: $ARGUMENTS

This must be a **problem name** (e.g. `hs1`, `arglina`). Strip a leading `src/Meta/` prefix or trailing `.jl` suffix if present.

If `$ARGUMENTS` is empty after stripping, ask the user to provide a problem name (e.g. `/review-meta hs1`) and stop — do not try to infer from the open file.

---

## Instructions

Follow these steps in order.

### Step 1 — Read the files

1. Read `src/Meta/<name>.jl` in full.
2. Glob-check whether the sibling implementation files exist:
   - `src/ADNLPProblems/<name>.jl`
   - `src/PureJuMP/<name>.jl`

### Step 2 — Load authoritative lists from source

Read two source files to get the ground-truth lists. Do NOT rely on hardcoded lists.

**Required Dict fields** — read `src/OptimizationProblems.jl` and extract the `cols_names` array (around lines 34–57). Each symbol in that array is a required key in the meta Dict.

**Valid `:lib` collection names** — read `src/utils.jl` and extract all keys of the `LIB_REFERENCES` Dict (around lines 10–106). Only these keys are valid as the collection part of a `"Collection:ID"` entry.

### Step 3 — Static analysis

Scan the text of `src/Meta/<name>.jl` and collect findings under three severity levels.

#### Structural (→ Error)

- [ ] The file defines exactly `<name>_meta = Dict(` — variable name must match the filename base.
- [ ] The file does NOT contain the word `export`.
- [ ] Every symbol from `cols_names` (Step 2) appears as a key in the Dict.
- [ ] The value of `:name` in the Dict is the string `"<name>"` (matches the filename base).
- [ ] All six base getter functions are present (required for **all** problems, not only scalable ones):
  `get_<name>_nvar`, `get_<name>_ncon`, `get_<name>_nlin`, `get_<name>_nnln`, `get_<name>_nequ`, `get_<name>_nineq`
- [ ] If `:objtype => :least_squares`, then `get_<name>_nls_nequ` is also present.
- [ ] Each getter — including `get_<name>_nls_nequ` when present — has `n::Int = default_nvar` as its first keyword argument and ends with `kwargs...`. Additional named keyword arguments with defaults (e.g. `nx`, `ny`, `nc`, `m`) are permitted between `n` and `kwargs...`.

#### Field values (→ Error)

| Field | Valid values |
|-------|-------------|
| `:nvar` | Non-negative integer literal |
| `:variable_nvar` | `true` or `false` |
| `:ncon` | Non-negative integer literal |
| `:variable_ncon` | `true` or `false` |
| `:minimize` | `true` or `false` |
| `:name` | String matching filename base |
| `:has_equalities_only` | `true` or `false` |
| `:has_inequalities_only` | `true` or `false` |
| `:has_bounds` | `true` or `false` |
| `:has_fixed_variables` | `true` or `false` |
| `:objtype` | One of `:none :constant :linear :quadratic :sum_of_squares :least_squares :other` |
| `:contype` | One of `:unconstrained :linear :quadratic :general` |
| `:best_known_lower_bound` | A real number or `-Inf` or `Inf` |
| `:best_known_upper_bound` | A real number or `-Inf` or `Inf` |
| `:is_feasible` | `true`, `false`, or `missing` |
| `:defined_everywhere` | `true`, `false`, or `missing` |
| `:origin` | One of `:academic :modelling :real :unknown` |
| `:url` | String — empty string `""` is OK; if non-empty, every comma-separated part must match `^https?://[^\s/$.?#][^\s]*$` (case-insensitive) |
| `:notes` | Any string (raw strings allowed) |
| `:origin_notes` | Any string (raw strings allowed) |
| `:reference` | String — empty is OK; if non-empty after stripping whitespace, must start with `@word{key,` or `@word(key,` and have balanced `{}` braces |
| `:lib` | String — empty is OK; if non-empty, every comma-separated entry must match `^(\w+):\S+$` and the word before `:` must be a key of `LIB_REFERENCES` (from Step 2) |

#### Logical consistency (→ Error)

1. `best_known_lower_bound <= best_known_upper_bound` — check only when both are finite numeric literals in the text.
2. `has_equalities_only` and `has_inequalities_only` cannot both be `true`.
3. If `:ncon => 0`: `:has_equalities_only` and `:has_inequalities_only` must both be `false`.
4. If `:ncon => 0`: the return value of each of `get_<name>_nlin`, `get_<name>_nnln`, `get_<name>_nequ`, `get_<name>_nineq` must be the literal `0`. To check this, extract the full getter definition — from the line containing `get_<name>_nlin` up to and including its closing `end` (for `function` form) or the `= expr` part (for one-liner form). The signature may span multiple lines (extra kwargs like `nc`, `nx`, `ny` before `kwargs...` are allowed); do **not** assume `= 0` immediately follows the closing `)` of the signature on the same line.
5. If `:contype => :unconstrained`: `:ncon` must be `0` (rules 3–4 follow).
6. If `:contype => :unconstrained`: `:has_equalities_only` and `:has_inequalities_only` must both be `false`.
7. If `:variable_nvar => false`: the body of `get_<name>_nvar` must not reference `n`. Extract the full getter body (spanning multiple lines if needed — the body ends at the next blank line or the next `get_` definition) and check that `\bn\b` does not appear in the return expression.
8. If `:variable_nvar => true`: the body of `get_<name>_nvar` must reference `n`. Use the same multiline extraction as rule 7.
9. If `:variable_ncon => false`: the body of `get_<name>_ncon` must not reference `n` (same multiline extraction).
10. If `:variable_ncon => true`: the body of `get_<name>_ncon` must reference `n` (same multiline extraction).

#### Documentation quality (→ Warning)

- `:url` is an empty string.
- `:notes` is an empty string (or raw string containing only whitespace).
- `:reference` is an empty string (no BibTeX citation provided).

#### Noteworthy (→ Info)

- `:origin => :unknown` — suggest updating to `:academic`, `:modelling`, or `:real`.
- `:minimize => false` — maximization problem (rare).
- `:is_feasible => false` — starting point is infeasible.
- `:is_feasible => missing` — feasibility unknown.
- `:defined_everywhere => false` — restricted domain.
- `:origin_notes` is an empty string — no provenance recorded.
- `src/ADNLPProblems/<name>.jl` does not exist — JuMP-only problem.
- `src/PureJuMP/<name>.jl` does not exist — AD-only problem.
- `:url` contains multiple comma-separated URLs (just count them, no error).
- `:best_known_upper_bound => Inf` for a minimization problem — no upper bound on optimal value known.
- `:best_known_lower_bound != -Inf` for a minimization problem — a useful lower bound is recorded.

### Step 4 — Dynamic analysis (run Julia)

Run the following Julia snippet via the Bash tool. Replace `PROBLEM_NAME` with the actual name.

> **Prerequisite:** `NLPModels`, `NLPModelsJuMP`, and `ADNLPModels` are test-only extras in `Project.toml` (not in `[deps]`). `julia --project` still finds them via the global environment if they are installed there. If the snippet fails with a package-not-found error, install them first:
> ```
> julia -e "import Pkg; Pkg.add([\"NLPModels\", \"NLPModelsJuMP\", \"ADNLPModels\"])"
> ```

```bash
julia --project -e "
using OptimizationProblems, NLPModels
import OptimizationProblems.ADNLPProblems, OptimizationProblems.PureJuMP
import NLPModelsJuMP, ADNLPModels

name = \"PROBLEM_NAME\"
meta = OptimizationProblems.eval(Symbol(name, :_meta))

nlp = nothing
model_source = \"none\"
try
  global nlp, model_source
  if Symbol(name) in names(ADNLPProblems, all=false)
    nlp = ADNLPProblems.eval(Symbol(name))()
    model_source = \"ADNLPProblems\"
  elseif Symbol(name) in names(PureJuMP, all=false)
    m = PureJuMP.eval(Symbol(name))()
    nlp = NLPModelsJuMP.MathOptNLPModel(m)
    model_source = \"PureJuMP\"
  end
catch e
  println(\"LOAD_ERROR: \", e)
end

println(\"MODEL_SOURCE:\", model_source)

if nlp !== nothing
  get_pb_nvar  = OptimizationProblems.eval(Symbol(:get_, name, :_nvar))
  get_pb_ncon  = OptimizationProblems.eval(Symbol(:get_, name, :_ncon))
  get_pb_nlin  = OptimizationProblems.eval(Symbol(:get_, name, :_nlin))
  get_pb_nnln  = OptimizationProblems.eval(Symbol(:get_, name, :_nnln))
  get_pb_nequ  = OptimizationProblems.eval(Symbol(:get_, name, :_nequ))
  get_pb_nineq = OptimizationProblems.eval(Symbol(:get_, name, :_nineq))

  actual_nequ = length(get_jfix(nlp))

  checks = [
    (\"meta_nvar\",             meta[:nvar],                nlp.meta.nvar,                          meta[:nvar] == nlp.meta.nvar || meta[:variable_nvar]),
    (\"meta_ncon\",             meta[:ncon],                nlp.meta.ncon,                          meta[:ncon] == nlp.meta.ncon || meta[:variable_ncon]),
    (\"minimize\",              meta[:minimize],            get_minimize(nlp),                      meta[:minimize] == get_minimize(nlp)),
    (\"has_bounds\",            meta[:has_bounds],          length(get_ifree(nlp)) < get_nvar(nlp), meta[:has_bounds] == (length(get_ifree(nlp)) < get_nvar(nlp))),
    (\"has_fixed_variables\",   meta[:has_fixed_variables], get_ifix(nlp) != [],                    meta[:has_fixed_variables] == (get_ifix(nlp) != [])),
    (\"has_equalities_only\",   meta[:has_equalities_only], actual_nequ == get_ncon(nlp) > 0,       meta[:has_equalities_only]  == (actual_nequ == get_ncon(nlp) > 0)),
    (\"has_inequalities_only\", meta[:has_inequalities_only], get_ncon(nlp) > 0 && actual_nequ == 0, meta[:has_inequalities_only] == (get_ncon(nlp) > 0 && actual_nequ == 0)),
    (\"getter_nvar\",           get_pb_nvar(),                 nlp.meta.nvar,                          get_pb_nvar()  == nlp.meta.nvar  || meta[:variable_nvar]),
    (\"getter_ncon\",           get_pb_ncon(),                 nlp.meta.ncon,                          get_pb_ncon()  == nlp.meta.ncon  || meta[:variable_ncon]),
    (\"getter_nlin\",           get_pb_nlin(),                 nlp.meta.nlin,                          get_pb_nlin()  == nlp.meta.nlin  || meta[:variable_ncon]),
    (\"getter_nnln\",           get_pb_nnln(),                 nlp.meta.nnln,                          get_pb_nnln()  == nlp.meta.nnln  || meta[:variable_ncon]),
    (\"getter_nequ\",           get_pb_nequ(),                 actual_nequ,                            get_pb_nequ()  == actual_nequ    || meta[:variable_ncon]),
    (\"getter_nineq\",          get_pb_nineq(),                nlp.meta.ncon - actual_nequ,            get_pb_nineq() == (nlp.meta.ncon - actual_nequ) || meta[:variable_ncon]),
  ]

  for (label, meta_val, actual_val, ok) in checks
    println(ok ? \"OK\" : \"FAIL\", \" \", label, \": meta=\", meta_val, \" actual=\", actual_val)
  end

  if meta[:objtype] == :least_squares && model_source == \"ADNLPProblems\"
    nls_getter = OptimizationProblems.eval(Symbol(:get_, name, :_nls_nequ))
    nls_val = nls_getter()
    nls_nlp = ADNLPProblems.eval(Symbol(name))(use_nls = true)
    ok = nls_val == nls_nlp.nls_meta.nequ
    println(ok ? \"OK\" : \"FAIL\", \" getter_nls_nequ: meta=\", nls_val, \" actual=\", nls_nlp.nls_meta.nequ)
  end

  f0 = try obj(nlp, nlp.meta.x0) catch; NaN end
  println(\"DEFINED_EVERYWHERE_CHECK finite=\", isfinite(f0), \" meta=\", meta[:defined_everywhere])
else
  println(\"SKIP no implementation available\")
end
"
```

Interpret the output as follows:

| Line pattern | Action |
|---|---|
| `MODEL_SOURCE:ADNLPProblems` or `MODEL_SOURCE:PureJuMP` | Note in the report which implementation was used |
| `MODEL_SOURCE:none` | Add Info: no implementation file found |
| `LOAD_ERROR: ...` | Add Info: implementation could not be instantiated, dynamic checks skipped |
| `OK <field>: meta=X actual=Y` | No finding |
| `FAIL <field>: meta=X actual=Y` | Add Error: `:field` is `X` in the meta but the actual model has `Y` |
| `DEFINED_EVERYWHERE_CHECK finite=false meta=true` | Add Warning: objective is NaN/Inf at starting point but `:defined_everywhere => true` |
| `DEFINED_EVERYWHERE_CHECK finite=false meta=missing` | Add Warning: objective is NaN/Inf at starting point; `:defined_everywhere` should probably be `false` |
| `DEFINED_EVERYWHERE_CHECK finite=false meta=false` | Add Info: consistent — domain is declared restricted and x0 confirms it |
| `DEFINED_EVERYWHERE_CHECK finite=true ...` | No finding |
| `SKIP ...` | Add Info: no implementation available, dynamic checks skipped |

### Step 5 — Report

Output:

```
## review-meta: <name>   [src/Meta/<name>.jl]
Dynamic checks: <ADNLPProblems | PureJuMP | not available>

### Errors (N)
- [E] <field or check>: <what was wrong and what was expected>

### Warnings (N)
- [W] <field>: <what is missing or suspicious>

### Info (N)
- [I] <field or observation>: <what was noted>

---
Summary: N error(s), N warning(s), N info.
```

If there are zero findings in a tier, omit that section header entirely. End with one sentence summarising the overall state, e.g.:

- "No errors found — the file looks correct."
- "1 error requires attention before this file can pass the test suite."
- "3 errors found; the most critical is the invalid BibTeX in `:reference`."

---

## Quick reference: valid symbol sets

These are listed here for clarity. When in doubt, cross-check against the docstring in `src/OptimizationProblems.jl`.

- `:objtype`: `:none`, `:constant`, `:linear`, `:quadratic`, `:sum_of_squares`, `:least_squares`, `:other`
- `:contype`: `:unconstrained`, `:linear`, `:quadratic`, `:general`
- `:origin`: `:academic`, `:modelling`, `:real`, `:unknown`

## Reference example

`src/Meta/arglina.jl` is the gold-standard: scalable NLS problem with all 22 fields and all 7 getters correctly filled in.
