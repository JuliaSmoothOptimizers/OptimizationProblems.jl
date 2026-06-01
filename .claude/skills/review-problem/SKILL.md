---
name: review-problem
description: Full review of a problem across all three files (ADNLPProblems, PureJuMP, Meta).
             Combines per-file correctness checks with cross-file coherence checks.
             Reports consolidated findings as Errors / Warnings / Info.
argument-hint: <problem-name>
allowed-tools: [Read, Glob, Grep, Bash]
---

# review-problem

Perform a complete audit of all three files for a single optimization problem:
- **Per-file correctness** (by applying the rules from each per-category skill)
- **Cross-file coherence** (ADNLPProblems and PureJuMP implement the same problem;
  Meta accurately describes both)

The result is a single consolidated report with four sections:
`[ADNLPProblems]` | `[PureJuMP]` | `[Meta]` | `[Cross-checks]`

---

## Arguments

The user invoked this skill with: $ARGUMENTS

This must be a **problem name** (e.g. `hs100`, `arglina`). Strip a leading path prefix
(`src/ADNLPProblems/`, `src/PureJuMP/`, `src/Meta/`) or a trailing `.jl` suffix if present.

If `$ARGUMENTS` is empty after stripping, ask the user to provide a problem name
(e.g. `/review-problem hs100`) and stop.

---

## Known Exceptions

Apply these before reporting any finding:

| Exception | Affected problems | Treatment |
|-----------|-------------------|-----------|
| Objective precision (JuMP vs AD) | `triangle_pacman`, `triangle_deer` | Downgrade `JU:FAIL compat_obj_*` and `CROSS:FAIL compat_obj_rand` from Error → Info |
| Residual allocation (known allocators) | Names starting with `"palmer"` or equal to `"watson"` | Downgrade `AD:FAIL residual_alloc` from Error → Info |
| JuMP-only (no ADNLPProblems) | `catmix`, `gasoil`, `glider`, `methanol`, `minsurf`, `pinene`, `rocket`, `steering`, `torsion` | Missing ADNLP file → Info (not Error); all AD checks and cross-checks skipped |
| AD-only (no PureJuMP) | `curly10`, `curly20`, `curly30` | Missing JuMP file → Info; JU checks and cross-checks skipped |

---

## Instructions

Follow these steps in order.

### Step 1 — File existence check

Glob-check whether all three files exist:
- `src/ADNLPProblems/<name>.jl`
- `src/PureJuMP/<name>.jl`
- `src/Meta/<name>.jl`

For each missing file:
- Missing **Meta** → **Error** (problem absent from `OptimizationProblems.meta`)
- Missing **ADNLPProblems** → Info if in the JuMP-only exclusion list; **Warning** otherwise
- Missing **PureJuMP** → Info if in the AD-only exclusion list; **Warning** otherwise

### Step 2 — Read all present files

Read each file that exists in full.

### Step 3 — Detect problem characteristics

Determine from the file content (prefer ADNLPProblems text if present, else PureJuMP):

- **Is scalable?** — `n` is actually used in the body beyond the signature.
- **Has n-adjustment?** — body modifies `n` before using it.
- **Is NLS?** — `use_nls::Bool` appears in a signature, or `ADNLSModel!` is called.
- **Has nonlinear constraints?** — a `c!` function is defined, or `@NLconstraint` appears.
- **Has linear constraints?** — `clinrows`/`clincols`/`clinvals`, or a `@constraint` with linear expressions.
- **Has variable bounds?** — `lvar`/`uvar` defined, or `@variable` with bounds.

### Step 4 — Static analysis

Apply the per-file rules by reference to the per-category skills:

- **ADNLPProblems file** (if present): apply every rule from `review-adnlpproblems` Step 3
  (structural, signature, constructor `!`-suffix, type stability warnings, n-adjustment, objective literals).

- **PureJuMP file** (if present): apply every rule from `review-purejump` Step 3
  (structural, start values, signature, n-adjustment, noteworthy patterns).

- **Meta file** (if present): apply every rule from `review-meta` Step 3
  (structural, field values, logical consistency, documentation quality, noteworthy).

Collect findings per-file under the three severity tiers (Error / Warning / Info).

### Step 5 — Dynamic analysis

Run the combined Julia snippet below. Replace `PROBLEM_NAME` with the actual problem name.

> **Prerequisite:** `NLPModels`, `NLPModelsJuMP`, and `ADNLPModels` must be available.
> If the snippet fails with a package-not-found error, install them first:
> ```
> julia -e "import Pkg; Pkg.add([\"NLPModels\", \"NLPModelsJuMP\", \"ADNLPModels\"])"
> ```

```bash
julia --project -e "
using OptimizationProblems, NLPModels, Random
import OptimizationProblems.ADNLPProblems, OptimizationProblems.PureJuMP
import NLPModelsJuMP, ADNLPModels

name = \"PROBLEM_NAME\"

# ============================================================
# BLOCK A — ADNLPProblems checks  (output prefix: AD:)
# ============================================================

ad_ctor = nothing
nlp_ad  = nothing

if Symbol(name) in names(ADNLPProblems, all=false)
  ad_ctor = ADNLPProblems.eval(Symbol(name))
  println(\"AD:OK export\")
else
  println(\"AD:INFO no_ad_sibling\")
end

if ad_ctor !== nothing
  # --- Float64 instantiation ---
  try
    global nlp_ad = ad_ctor()
    println(\"AD:OK instantiate_f64\")
  catch e
    println(\"AD:FAIL instantiate_f64: \", e)
  end

  if nlp_ad !== nothing
    # name keyword
    println(nlp_ad.meta.name == name ? \"AD:OK name\" :
      \"AD:FAIL name: got \$(nlp_ad.meta.name)\")

    # objective at x0
    f0_ad = try obj(nlp_ad, nlp_ad.meta.x0) catch e
      println(\"AD:FAIL obj_at_x0: \", e); NaN
    end
    if !isnan(f0_ad)
      println(isfinite(f0_ad) ? \"AD:OK obj_at_x0: \$(f0_ad)\" :
        \"AD:WARN obj_at_x0: non-finite value \$(f0_ad)\")
    end

    # --- Float32 type stability ---
    nlp32 = nothing
    try
      global nlp32 = ad_ctor(type = Float32)
      println(\"AD:OK instantiate_f32\")
    catch e
      println(\"AD:FAIL instantiate_f32: \", e)
    end
    if nlp32 !== nothing
      x0_32 = nlp32.meta.x0
      println(eltype(x0_32) == Float32 ? \"AD:OK x0_eltype_f32\" :
        \"AD:FAIL x0_eltype_f32: \$(eltype(x0_32))\")
      f32 = try obj(nlp32, x0_32) catch e
        println(\"AD:FAIL obj_f32: \", e); nothing
      end
      if f32 !== nothing
        println(typeof(f32) == Float32 ? \"AD:OK obj_type_f32\" :
          \"AD:FAIL obj_type_f32: \$(typeof(f32))\")
      end
      if nlp32.meta.ncon > 0
        c32 = try cons(nlp32, x0_32) catch e
          println(\"AD:FAIL cons_f32: \", e); nothing
        end
        if c32 !== nothing
          println(eltype(c32) == Float32 ? \"AD:OK cons_eltype_f32\" :
            \"AD:FAIL cons_eltype_f32: \$(eltype(c32))\")
        end
      end
    end

    # --- Allocation-free cons_nln! ---
    if nlp_ad.meta.nnln > 0 && nlp_ad isa ADNLPModels.AbstractADNLPModel
      x_alloc = nlp_ad.meta.x0; cx_alloc = similar(x_alloc, nlp_ad.meta.nnln)
      try
        cons_nln!(nlp_ad, x_alloc, cx_alloc)
        cons_nln!(nlp_ad, x_alloc, cx_alloc)
        alloc = @allocated cons_nln!(nlp_ad, x_alloc, cx_alloc)
        println(alloc == 0 ? \"AD:OK cons_nln_alloc\" :
          \"AD:FAIL cons_nln_alloc: \$(alloc) bytes\")
      catch e
        println(\"AD:FAIL cons_nln_eval: \", e)
      end
    end

    # --- NLS checks ---
    nls_ad = nothing
    try
      global nls_ad = ad_ctor(use_nls = true)
      if !(nls_ad isa NLPModels.AbstractNLSModel)
        println(\"AD:INFO nls_not_supported\")
        nls_ad = nothing
      else
        println(\"AD:OK nls_dispatch\")
        println(nls_ad.meta.name == name * \"-nls\" ? \"AD:OK nls_name\" :
          \"AD:FAIL nls_name: got \$(nls_ad.meta.name)\")
        println(nlp_ad.meta.x0 == nls_ad.meta.x0 ? \"AD:OK nls_x0_matches\" :
          \"AD:FAIL nls_x0_matches\")
        x_nls = nls_ad.meta.x0; Fx = similar(x_nls, nls_ad.nls_meta.nequ)
        try
          residual!(nls_ad, x_nls, Fx)
          residual!(nls_ad, x_nls, Fx)
          alloc_r = @allocated residual!(nls_ad, x_nls, Fx)
          println(alloc_r == 0 ? \"AD:OK residual_alloc\" :
            \"AD:FAIL residual_alloc: \$(alloc_r) bytes\")
        catch e
          println(\"AD:FAIL residual_eval: \", e)
        end
        nlp_obj = try obj(nlp_ad, nlp_ad.meta.x0) catch; NaN end
        nls_obj = try obj(nls_ad, nls_ad.meta.x0) catch; NaN end
        if !isnan(nlp_obj) && !isnan(nls_obj)
          ok_nls = isapprox(nlp_obj, nls_obj, rtol=1e-8) ||
                   isapprox(nlp_obj, 2*nls_obj, rtol=1e-8)
          println(ok_nls ? \"AD:OK nls_nlp_obj_agree\" :
            \"AD:FAIL nls_nlp_obj_agree: nlp=\$(nlp_obj) nls=\$(nls_obj)\")
        end
      end
    catch
      println(\"AD:INFO nls_not_supported\")
    end
  end
end  # end Block A

# ============================================================
# BLOCK B — PureJuMP + meta-consistency + scalability + compat
#           (output prefix: JU:)
# ============================================================

nlp_jump = nothing
meta     = nothing

if Symbol(name) in names(PureJuMP, all=false)
  ctor_ju = PureJuMP.eval(Symbol(name))
  println(\"JU:OK export\")

  model_ju = nothing
  try
    global model_ju = ctor_ju()
    println(\"JU:OK instantiate_model\")
  catch e
    println(\"JU:FAIL instantiate_model: \", e)
  end

  if model_ju !== nothing
    try
      global nlp_jump = NLPModelsJuMP.MathOptNLPModel(model_ju)
      println(\"JU:OK wrap_nlpmodel\")
    catch e
      println(\"JU:FAIL wrap_nlpmodel: \", e)
    end

    if nlp_jump !== nothing
      f0_ju = try obj(nlp_jump, nlp_jump.meta.x0) catch e
        println(\"JU:FAIL obj_at_x0: \", e); NaN
      end
      if !isnan(f0_ju)
        println(isfinite(f0_ju) ? \"JU:OK obj_at_x0: \$(f0_ju)\" :
          \"JU:WARN obj_at_x0: non-finite value \$(f0_ju)\")
      end

      # --- Meta-consistency ---
      if isdefined(OptimizationProblems, Symbol(name, :_meta))
        global meta = OptimizationProblems.eval(Symbol(name, :_meta))
        get_pb_nvar  = OptimizationProblems.eval(Symbol(:get_, name, :_nvar))
        get_pb_ncon  = OptimizationProblems.eval(Symbol(:get_, name, :_ncon))
        get_pb_nlin  = OptimizationProblems.eval(Symbol(:get_, name, :_nlin))
        get_pb_nnln  = OptimizationProblems.eval(Symbol(:get_, name, :_nnln))
        get_pb_nequ  = OptimizationProblems.eval(Symbol(:get_, name, :_nequ))
        get_pb_nineq = OptimizationProblems.eval(Symbol(:get_, name, :_nineq))
        actual_nequ  = length(get_jfix(nlp_jump))

        checks_meta = [
          (\"meta_nvar\",             meta[:nvar],
            nlp_jump.meta.nvar,
            meta[:nvar] == nlp_jump.meta.nvar || meta[:variable_nvar]),
          (\"meta_ncon\",             meta[:ncon],
            nlp_jump.meta.ncon,
            meta[:ncon] == nlp_jump.meta.ncon || meta[:variable_ncon]),
          (\"minimize\",              meta[:minimize],
            get_minimize(nlp_jump),
            meta[:minimize] == get_minimize(nlp_jump)),
          (\"has_bounds\",            meta[:has_bounds],
            length(get_ifree(nlp_jump)) < get_nvar(nlp_jump),
            meta[:has_bounds] == (length(get_ifree(nlp_jump)) < get_nvar(nlp_jump))),
          (\"has_fixed_variables\",   meta[:has_fixed_variables],
            get_ifix(nlp_jump) != [],
            meta[:has_fixed_variables] == (get_ifix(nlp_jump) != [])),
          (\"has_equalities_only\",   meta[:has_equalities_only],
            actual_nequ == get_ncon(nlp_jump) > 0,
            meta[:has_equalities_only] == (actual_nequ == get_ncon(nlp_jump) > 0)),
          (\"has_inequalities_only\", meta[:has_inequalities_only],
            get_ncon(nlp_jump) > 0 && actual_nequ == 0,
            meta[:has_inequalities_only] == (get_ncon(nlp_jump) > 0 && actual_nequ == 0)),
          (\"getter_nvar\",           get_pb_nvar(),
            nlp_jump.meta.nvar,
            get_pb_nvar()  == nlp_jump.meta.nvar  || meta[:variable_nvar]),
          (\"getter_ncon\",           get_pb_ncon(),
            nlp_jump.meta.ncon,
            get_pb_ncon()  == nlp_jump.meta.ncon  || meta[:variable_ncon]),
          (\"getter_nlin\",           get_pb_nlin(),
            nlp_jump.meta.nlin,
            get_pb_nlin()  == nlp_jump.meta.nlin  || meta[:variable_ncon]),
          (\"getter_nnln\",           get_pb_nnln(),
            nlp_jump.meta.nnln,
            get_pb_nnln()  == nlp_jump.meta.nnln  || meta[:variable_ncon]),
          (\"getter_nequ\",           get_pb_nequ(),
            actual_nequ,
            get_pb_nequ()  == actual_nequ          || meta[:variable_ncon]),
          (\"getter_nineq\",          get_pb_nineq(),
            nlp_jump.meta.ncon - actual_nequ,
            get_pb_nineq() == (nlp_jump.meta.ncon - actual_nequ) || meta[:variable_ncon]),
        ]
        for (label, meta_val, actual_val, ok) in checks_meta
          println(ok ? \"JU:OK\" : \"JU:FAIL\", \" \",
            label, \": meta=\", meta_val, \" actual=\", actual_val)
        end
        println(\"JU:DEFINED_EVERYWHERE_CHECK finite=\", isfinite(f0_ju),
          \" meta=\", meta[:defined_everywhere])

        # --- Scalability at n=5 ---
        if meta[:variable_nvar]
          try
            model2   = ctor_ju(n = 5)
            nlp_ju5  = NLPModelsJuMP.MathOptNLPModel(model2)
            n_exp    = get_pb_nvar(n = 5)
            println(nlp_ju5.meta.nvar == n_exp ? \"JU:OK scalable_nvar: \$(nlp_ju5.meta.nvar)\" :
              \"JU:FAIL scalable_nvar: got \$(nlp_ju5.meta.nvar) expected \$(n_exp)\")
            println(nlp_ju5.meta.nvar != nlp_jump.meta.nvar ? \"JU:OK scalable_changes\" :
              \"JU:WARN scalable_no_change: both n give nvar=\$(nlp_jump.meta.nvar)\")
          catch e
            println(\"JU:FAIL scalable_instantiate: \", e)
          end
        end
      else
        println(\"JU:INFO no_meta\")
      end

      # --- Compatibility with ADNLPProblems ---
      if nlp_ad !== nothing
        println(\"JU:OK ad_instantiate\")
        x0c = nlp_ad.meta.x0
        x1c = x0c .+ 0.01
        println(nlp_jump.meta.nvar == nlp_ad.meta.nvar ? \"JU:OK compat_nvar\" :
          \"JU:FAIL compat_nvar: jump=\$(nlp_jump.meta.nvar) ad=\$(nlp_ad.meta.nvar)\")
        println(nlp_jump.meta.ncon == nlp_ad.meta.ncon ? \"JU:OK compat_ncon\" :
          \"JU:FAIL compat_ncon: jump=\$(nlp_jump.meta.ncon) ad=\$(nlp_ad.meta.ncon)\")
        println(nlp_jump.meta.x0 == nlp_ad.meta.x0 ? \"JU:OK compat_x0\" :
          \"JU:FAIL compat_x0: starting points differ\")
        println(nlp_jump.meta.lvar == nlp_ad.meta.lvar ? \"JU:OK compat_lvar\" :
          \"JU:FAIL compat_lvar: lower bounds differ\")
        println(nlp_jump.meta.uvar == nlp_ad.meta.uvar ? \"JU:OK compat_uvar\" :
          \"JU:FAIL compat_uvar: upper bounds differ\")

        f_ju0 = try obj(nlp_jump, x0c) catch; NaN end
        f_ad0 = try obj(nlp_ad,   x0c) catch; NaN end
        if !isnan(f_ju0) && !isnan(f_ad0)
          n0c = max(abs(f_ad0), 1.0)
          println(isapprox(f_ju0, f_ad0, atol=1e-10*n0c) ? \"JU:OK compat_obj_x0\" :
            \"JU:FAIL compat_obj_x0: jump=\$(f_ju0) ad=\$(f_ad0)\")
          f_ju1 = try obj(nlp_jump, x1c) catch; NaN end
          f_ad1 = try obj(nlp_ad,   x1c) catch; NaN end
          if !isnan(f_ju1) && !isnan(f_ad1)
            n1c = max(abs(f_ad1), 1.0)
            println(isapprox(f_ju1, f_ad1, atol=1e-10*n1c) ? \"JU:OK compat_obj_x1\" :
              \"JU:FAIL compat_obj_x1: jump=\$(f_ju1) ad=\$(f_ad1)\")
          end
        end

        if nlp_ad.meta.ncon > 0
          c_ju0 = try cons(nlp_jump, x0c) catch; nothing end
          c_ad0 = try cons(nlp_ad,   x0c) catch; nothing end
          if c_ju0 !== nothing && c_ad0 !== nothing
            n0cc = max(maximum(abs.(c_ad0 .+ 1e-30)), 1.0)
            println(all(isapprox.(c_ju0, c_ad0, atol=1e-10*n0cc)) ? \"JU:OK compat_cons_x0\" :
              \"JU:FAIL compat_cons_x0: values differ at x0\")
            c_ju1 = try cons(nlp_jump, x1c) catch; nothing end
            c_ad1 = try cons(nlp_ad,   x1c) catch; nothing end
            if c_ju1 !== nothing && c_ad1 !== nothing
              n1cc = max(maximum(abs.(c_ad1 .+ 1e-30)), 1.0)
              println(all(isapprox.(c_ju1, c_ad1, atol=1e-10*n1cc)) ? \"JU:OK compat_cons_x1\" :
                \"JU:FAIL compat_cons_x1: values differ at x0+0.01\")
            end
            println(nlp_jump.meta.lcon ≈ nlp_ad.meta.lcon ? \"JU:OK compat_lcon\" :
              \"JU:FAIL compat_lcon: lower constraint bounds differ\")
            println(nlp_jump.meta.ucon ≈ nlp_ad.meta.ucon ? \"JU:OK compat_ucon\" :
              \"JU:FAIL compat_ucon: upper constraint bounds differ\")
            println(nlp_jump.meta.lin == nlp_ad.meta.lin ? \"JU:OK compat_lin\" :
              \"JU:FAIL compat_lin: linear index sets differ\")
          end
        end
      else
        println(\"JU:INFO no_ad_sibling\")
      end
    end
  end
else
  println(\"JU:INFO no_ju_sibling\")
end  # end Block B

# ============================================================
# BLOCK C — New cross-coherence checks  (output prefix: CROSS:)
# Runs only if both implementations were instantiated AND meta is loaded.
# ============================================================

if nlp_ad !== nothing && nlp_jump !== nothing && meta !== nothing

  # --- meta_contype ---
  ct = meta[:contype]
  ok_ct = (ct == :unconstrained && nlp_ad.meta.ncon == 0) ||
          (ct == :linear        && nlp_ad.meta.ncon > 0 && nlp_ad.meta.nnln == 0) ||
          (ct == :quadratic) ||
          (ct == :general       && nlp_ad.meta.nnln > 0)
  println(ok_ct ? \"CROSS:OK meta_contype\" :
    \"CROSS:FAIL meta_contype: \$(ct) vs ncon=\$(nlp_ad.meta.ncon) nlin=\$(nlp_ad.meta.nlin) nnln=\$(nlp_ad.meta.nnln)\")

  # --- meta_objtype_nls ---
  if meta[:objtype] == :least_squares
    try
      nls_c = ADNLPProblems.eval(Symbol(name))(use_nls = true)
      println(nls_c isa NLPModels.AbstractNLSModel ?
        \"CROSS:OK meta_objtype_nls\" :
        \"CROSS:FAIL meta_objtype_nls: use_nls=true returned non-NLSModel\")
    catch e
      println(\"CROSS:FAIL meta_objtype_nls: use_nls=true threw: \", e)
    end
  else
    println(\"CROSS:INFO meta_objtype_nls: objtype=\$(meta[:objtype])\")
  end

  # --- meta_is_feasible  (same logic as is_feasible() in test/utils.jl) ---
  feasible_actual = if nlp_ad.meta.ncon == 0
    true
  else
    cx_f = try cons(nlp_ad, nlp_ad.meta.x0) catch; nothing end
    if cx_f === nothing
      missing
    elseif all(nlp_ad.meta.lcon .<= cx_f .<= nlp_ad.meta.ucon) &&
           all(nlp_ad.meta.lvar .<= nlp_ad.meta.x0 .<= nlp_ad.meta.uvar)
      true
    elseif any(nlp_ad.meta.lvar .> nlp_ad.meta.uvar) ||
           any(nlp_ad.meta.lcon .> nlp_ad.meta.ucon)
      false
    else
      missing
    end
  end
  mf = meta[:is_feasible]
  if ismissing(mf)
    println(\"CROSS:INFO meta_is_feasible: meta=missing actual=\$(feasible_actual)\")
  elseif mf === feasible_actual
    println(\"CROSS:OK meta_is_feasible\")
  else
    println(\"CROSS:FAIL meta_is_feasible: meta=\$(mf) actual=\$(feasible_actual)\")
  end

  # --- compat_obj_rand / compat_cons_rand ---
  # Random point clipped element-wise to [lvar, uvar] (Inf → ±10 relative to x0)
  rng_r = MersenneTwister(42)
  x_rand_raw = nlp_ad.meta.x0 .+ 0.1 .* randn(rng_r, nlp_ad.meta.nvar)
  lv_r = [isinf(l) ? x0i - 10.0 : l for (l, x0i) in zip(nlp_ad.meta.lvar, nlp_ad.meta.x0)]
  uv_r = [isinf(u) ? x0i + 10.0 : u for (u, x0i) in zip(nlp_ad.meta.uvar, nlp_ad.meta.x0)]
  x_rand = min.(max.(x_rand_raw, lv_r), uv_r)
  f_ad_r = try obj(nlp_ad,   x_rand) catch; NaN end
  f_ju_r = try obj(nlp_jump, x_rand) catch; NaN end
  if !isnan(f_ad_r) && !isnan(f_ju_r)
    nrm_r = max(abs(f_ad_r), 1.0)
    println(isapprox(f_ad_r, f_ju_r, atol=1e-10*nrm_r) ? \"CROSS:OK compat_obj_rand\" :
      \"CROSS:FAIL compat_obj_rand: ad=\$(f_ad_r) jump=\$(f_ju_r)\")
  end
  if nlp_ad.meta.ncon > 0
    c_ad_r = try cons(nlp_ad,   x_rand) catch; nothing end
    c_ju_r = try cons(nlp_jump, x_rand) catch; nothing end
    if c_ad_r !== nothing && c_ju_r !== nothing
      nrm_cr = max(maximum(abs.(c_ad_r .+ 1e-30)), 1.0)
      println(all(isapprox.(c_ad_r, c_ju_r, atol=1e-10*nrm_cr)) ? \"CROSS:OK compat_cons_rand\" :
        \"CROSS:FAIL compat_cons_rand: differ at random point\")
    end
  end

  # --- compat_n5_* (scalable problems only) ---
  if meta[:variable_nvar]
    try
      nlp_ad5   = ADNLPProblems.eval(Symbol(name))(n = 5)
      model_5   = PureJuMP.eval(Symbol(name))(n = 5)
      nlp_jump5 = NLPModelsJuMP.MathOptNLPModel(model_5)
      println(nlp_ad5.meta.nvar == nlp_jump5.meta.nvar ? \"CROSS:OK compat_n5_nvar\" :
        \"CROSS:FAIL compat_n5_nvar: ad=\$(nlp_ad5.meta.nvar) jump=\$(nlp_jump5.meta.nvar)\")
      println(nlp_ad5.meta.ncon == nlp_jump5.meta.ncon ? \"CROSS:OK compat_n5_ncon\" :
        \"CROSS:FAIL compat_n5_ncon: ad=\$(nlp_ad5.meta.ncon) jump=\$(nlp_jump5.meta.ncon)\")
      x5 = nlp_ad5.meta.x0
      f5_ad = try obj(nlp_ad5,   x5) catch; NaN end
      f5_ju = try obj(nlp_jump5, x5) catch; NaN end
      if !isnan(f5_ad) && !isnan(f5_ju)
        nrm5 = max(abs(f5_ad), 1.0)
        println(isapprox(f5_ad, f5_ju, atol=1e-10*nrm5) ? \"CROSS:OK compat_n5_obj\" :
          \"CROSS:FAIL compat_n5_obj: ad=\$(f5_ad) jump=\$(f5_ju)\")
      end
    catch e
      println(\"CROSS:WARN compat_n5: could not instantiate at n=5: \", e)
    end
  end

  # --- meta_lin_check (20-point Jacobian sampling, from test_linear_constraints in test/utils.jl) ---
  if nlp_ad.meta.ncon > 0
    try
      lv_s = [isinf(l) ? -10.0 : l for l in nlp_ad.meta.lvar]
      uv_s = [isinf(u) ?  10.0 : u for u in nlp_ad.meta.uvar]
      ref_j = jac(nlp_ad, nlp_ad.meta.x0)
      Iref  = collect(1:nlp_ad.meta.ncon)
      for _ = 1:20
        xs = min.(max.(
          (2*rand(nlp_ad.meta.nvar).-1) .* max.(abs.(lv_s), abs.(uv_s)),
          lv_s), uv_s)
        cj = jac(nlp_ad, xs)
        setdiff!(Iref, findall(j -> cj[j,:] != ref_j[j,:], 1:nlp_ad.meta.ncon))
        isempty(Iref) && break
      end
      ok_lin = sort(Iref) == sort(collect(nlp_ad.meta.lin))
      println(ok_lin ? \"CROSS:OK meta_lin_check\" :
        \"CROSS:WARN meta_lin_check: sampling lin=\$(sort(Iref)) meta.lin=\$(sort(collect(nlp_ad.meta.lin)))\")
    catch e
      println(\"CROSS:INFO meta_lin_check: Jacobian sampling failed: \", e)
    end
  end

end  # end Block C
"
```

---

### Step 5 output interpretation

**Block A (`AD:` lines)**

| Line | Action |
|------|--------|
| `AD:OK export` | No finding |
| `AD:INFO no_ad_sibling` | Info: no ADNLPProblems file |
| `AD:OK instantiate_f64` | No finding |
| `AD:FAIL instantiate_f64: ...` | Error: cannot instantiate; subsequent AD checks skipped |
| `AD:OK name` | No finding |
| `AD:FAIL name: got X` | Error: `name` keyword is `X`, expected `"<name>"` |
| `AD:OK obj_at_x0: X` | No finding |
| `AD:FAIL obj_at_x0: ...` | Error: objective throws at starting point |
| `AD:WARN obj_at_x0: non-finite ...` | Warning: objective is Inf/NaN at x0 |
| `AD:OK instantiate_f32` | No finding |
| `AD:FAIL instantiate_f32: ...` | Error: cannot instantiate with Float32; type checks skipped |
| `AD:OK x0_eltype_f32` | No finding |
| `AD:FAIL x0_eltype_f32: X` | Error: `x0` element type is `X` not Float32 |
| `AD:OK obj_type_f32` | No finding |
| `AD:FAIL obj_type_f32: X` | Error: objective returns `X` not Float32 (float literal in body) |
| `AD:OK cons_eltype_f32` | No finding |
| `AD:FAIL cons_eltype_f32: X` | Error: constraint element type is `X` not Float32 |
| `AD:OK cons_nln_alloc` | No finding |
| `AD:FAIL cons_nln_alloc: N bytes` | Error: `cons_nln!` allocates |
| `AD:OK nls_dispatch` | Info: NLS supported |
| `AD:INFO nls_not_supported` | Info: no NLS variant |
| `AD:FAIL nls_name: got X` | Error: NLS variant has wrong `name` keyword |
| `AD:FAIL nls_x0_matches` | Error: NLS and NLP starting points differ |
| `AD:OK residual_alloc` | No finding |
| `AD:FAIL residual_alloc: N bytes` | Error: `residual!` allocates (Info for palmer/watson) |
| `AD:OK nls_nlp_obj_agree` | No finding |
| `AD:FAIL nls_nlp_obj_agree: nlp=X nls=Y` | Error: NLS and NLP objectives disagree |

**Block B (`JU:` lines)**

*Per-file JuMP checks (go in `[PureJuMP]` section):*

| Line | Action |
|------|--------|
| `JU:OK export` | No finding |
| `JU:INFO no_ju_sibling` | Info: no PureJuMP file |
| `JU:OK instantiate_model` | No finding |
| `JU:FAIL instantiate_model: ...` | Error: JuMP model construction fails |
| `JU:OK wrap_nlpmodel` | No finding |
| `JU:FAIL wrap_nlpmodel: ...` | Error: MathOptNLPModel wrapping fails |
| `JU:OK obj_at_x0: X` | No finding |
| `JU:FAIL obj_at_x0: ...` | Error: objective throws |
| `JU:WARN obj_at_x0: non-finite ...` | Warning: objective is Inf/NaN at x0 |

*Meta-consistency + getters + scalability + compat (go in `[Cross-checks]` section):*

| Line | Action |
|------|--------|
| `JU:INFO no_meta` | Info: no Meta file |
| `JU:OK meta_nvar: ...` | No finding |
| `JU:FAIL meta_nvar: meta=X actual=Y` | Error: `:nvar` mismatch |
| `JU:OK meta_ncon: ...` | No finding |
| `JU:FAIL meta_ncon: meta=X actual=Y` | Error: `:ncon` mismatch |
| `JU:OK minimize: ...` | No finding |
| `JU:FAIL minimize: ...` | Error: `:minimize` mismatch |
| `JU:OK has_bounds: ...` | No finding |
| `JU:FAIL has_bounds: ...` | Error: `:has_bounds` mismatch |
| `JU:OK has_fixed_variables: ...` | No finding |
| `JU:FAIL has_fixed_variables: ...` | Error: `:has_fixed_variables` mismatch |
| `JU:OK has_equalities_only: ...` | No finding |
| `JU:FAIL has_equalities_only: ...` | Error: `:has_equalities_only` mismatch |
| `JU:OK has_inequalities_only: ...` | No finding |
| `JU:FAIL has_inequalities_only: ...` | Error: `:has_inequalities_only` mismatch |
| `JU:OK getter_nvar: ...` | No finding |
| `JU:FAIL getter_nvar: meta=X actual=Y` | Error: getter formula wrong at default n |
| *(same for getter_ncon, getter_nlin, getter_nnln, getter_nequ, getter_nineq)* | |
| `JU:DEFINED_EVERYWHERE_CHECK finite=false meta=true` | Warning: obj undefined at x0 but `:defined_everywhere => true` |
| `JU:DEFINED_EVERYWHERE_CHECK finite=false meta=missing` | Warning: obj undefined; `:defined_everywhere` should be `false` |
| `JU:DEFINED_EVERYWHERE_CHECK finite=false meta=false` | Info: consistent |
| `JU:OK scalable_nvar: N` | No finding |
| `JU:FAIL scalable_nvar: got N expected M` | Error: nvar at n=5 disagrees with getter |
| `JU:OK scalable_changes` | No finding |
| `JU:WARN scalable_no_change: ...` | Warning: `variable_nvar=true` but size doesn't change |
| `JU:FAIL scalable_instantiate: ...` | Error: instantiation at n=5 fails |
| `JU:OK compat_nvar` | No finding |
| `JU:FAIL compat_nvar: ...` | Error: nvar mismatch between JuMP and AD |
| `JU:OK compat_ncon` | No finding |
| `JU:FAIL compat_ncon: ...` | Error: ncon mismatch |
| `JU:OK compat_x0` | No finding |
| `JU:FAIL compat_x0: ...` | Error: starting points differ |
| `JU:OK compat_lvar` / `JU:FAIL compat_lvar: ...` | No finding / Error: lower variable bounds differ |
| `JU:OK compat_uvar` / `JU:FAIL compat_uvar: ...` | No finding / Error: upper variable bounds differ |
| `JU:OK compat_obj_x0` / `JU:FAIL compat_obj_x0: ...` | No finding / Error (Info for triangle_pacman/deer) |
| `JU:OK compat_obj_x1` / `JU:FAIL compat_obj_x1: ...` | No finding / Error (Info for triangle_pacman/deer) |
| `JU:OK compat_cons_x0` / `JU:FAIL compat_cons_x0: ...` | No finding / Error: constraints differ at x0 |
| `JU:OK compat_cons_x1` / `JU:FAIL compat_cons_x1: ...` | No finding / Error: constraints differ at x0+0.01 |
| `JU:OK compat_lcon` / `JU:FAIL compat_lcon: ...` | No finding / Error: lower constraint bounds differ |
| `JU:OK compat_ucon` / `JU:FAIL compat_ucon: ...` | No finding / Error: upper constraint bounds differ |
| `JU:OK compat_lin` / `JU:FAIL compat_lin: ...` | No finding / Error: linear index sets differ |
| `JU:INFO no_ad_sibling` | Info: JuMP-only problem; compat checks skipped |

**Block C (`CROSS:` lines)** — all go in `[Cross-checks]` section

| Line | Action |
|------|--------|
| `CROSS:OK meta_contype` | No finding |
| `CROSS:FAIL meta_contype: X vs ...` | Error: `:contype` symbol inconsistent with actual nlin/nnln |
| `CROSS:OK meta_objtype_nls` | No finding |
| `CROSS:FAIL meta_objtype_nls: ...` | Error: `:least_squares` but `use_nls=true` fails |
| `CROSS:INFO meta_objtype_nls: objtype=X` | Info: not a least-squares problem |
| `CROSS:OK meta_is_feasible` | No finding |
| `CROSS:FAIL meta_is_feasible: meta=X actual=Y` | Error: `:is_feasible` flag wrong |
| `CROSS:INFO meta_is_feasible: meta=missing ...` | Info: feasibility documented as unknown |
| `CROSS:OK compat_obj_rand` | No finding |
| `CROSS:FAIL compat_obj_rand: ad=X jump=Y` | Error (Info for triangle_pacman/deer): objectives differ at random point |
| `CROSS:OK compat_cons_rand` | No finding |
| `CROSS:FAIL compat_cons_rand: ...` | Error: constraints differ at random point |
| `CROSS:OK compat_n5_nvar` | No finding |
| `CROSS:FAIL compat_n5_nvar: ad=X jump=Y` | Error: nvar at n=5 differs between ADNLP and JuMP |
| `CROSS:OK compat_n5_ncon` | No finding |
| `CROSS:FAIL compat_n5_ncon: ad=X jump=Y` | Error: ncon at n=5 differs |
| `CROSS:OK compat_n5_obj` | No finding |
| `CROSS:FAIL compat_n5_obj: ad=X jump=Y` | Error: objectives at n=5 differ |
| `CROSS:WARN compat_n5: ...` | Warning: could not instantiate at n=5 |
| `CROSS:OK meta_lin_check` | No finding |
| `CROSS:WARN meta_lin_check: sampling lin=X meta.lin=Y` | Warning: Jacobian sampling disagrees with `meta.lin` |
| `CROSS:INFO meta_lin_check: ...` | Info: Jacobian sampling failed (e.g., dense problem) |

---

### Step 6 — Report

Output in this format:

```
## review-problem: <name>
Files: ADNLPProblems ✓/✗  |  PureJuMP ✓/✗  |  Meta ✓/✗
Characteristics: <scalable|fixed>, <contype>, <NLS|NLP>

### [ADNLPProblems]  src/ADNLPProblems/<name>.jl
<Static findings from Step 4 + AD: dynamic lines>
#### Errors (N)
- [E] ...
#### Warnings (N)
- [W] ...
#### Info (N)
- [I] ...

### [PureJuMP]  src/PureJuMP/<name>.jl
<Static findings from Step 4 + JU: per-file dynamic lines (export/instantiate/obj)>
#### Errors (N) / Warnings (N) / Info (N)

### [Meta]  src/Meta/<name>.jl
<Static findings from Step 4>
#### Errors (N) / Warnings (N) / Info (N)

### [Cross-checks]  ADNLP ↔ JuMP ↔ Meta
<All JU:meta_*, JU:getter_*, JU:DEFINED_EVERYWHERE_CHECK, JU:scalable_*, JU:compat_*,
 and all CROSS:* lines>
#### Errors (N) / Warnings (N) / Info (N)

---
Overall: N error(s), N warning(s), N info.
<One-sentence verdict.>
```

- Each tier with zero findings: **omit that section header entirely**.
- Cross-check lines land **exclusively** in `[Cross-checks]` — never duplicated in per-file sections.
- Empty tier sections are omitted.
- End with a clear one-sentence verdict.

---

## Quick reference

### What each block covers

| Block | Prefix | File | Key new checks vs. per-category skills |
|-------|--------|------|----------------------------------------|
| A | `AD:` | ADNLPProblems | (same as review-adnlpproblems Step 4) |
| B | `JU:` | PureJuMP + Meta + compat | (same as review-purejump Step 4) |
| C | `CROSS:` | All three | meta_contype, meta_objtype_nls, meta_is_feasible, compat_obj_rand, compat_cons_rand, compat_n5_*, meta_lin_check |

### New checks in Block C and why they matter

| Check | Why it's needed |
|-------|-----------------|
| `meta_contype` | `:contype` symbol is never validated against actual nlin/nnln by CI |
| `meta_objtype_nls` | `:least_squares` flag is never verified to imply a working `use_nls=true` |
| `meta_is_feasible` | `is_feasible()` in test/utils.jl is only used for generation, never for validation |
| `compat_obj_rand` | Two fixed points (x0, x0+0.01) miss formula bugs that cancel there |
| `compat_cons_rand` | Same as above for constraints |
| `compat_n5_*` | review-purejump checks JuMP at n=5 vs its getter; not against ADNLP at n=5 |
| `meta_lin_check` | `test_linear_constraints()` (test/utils.jl:181) exists but is **never called in CI** |

### Reference problems for testing this skill

```
/review-problem arwhead    # clean scalable unconstrained; compat_n5_* fires
/review-problem hs100      # constrained fixed-size; meta_contype, meta_is_feasible, meta_lin_check
/review-problem lanczos1   # NLS; CROSS:OK meta_objtype_nls + AD:OK residual_alloc
/review-problem catmix     # JuMP-only; AD/cross-checks skipped gracefully
```
