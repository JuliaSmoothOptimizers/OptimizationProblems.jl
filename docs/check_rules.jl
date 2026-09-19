# Script to check OptimizationProblems.jl rules for HS85/HS89
using JSON

# All paths are resolved relative to the repository root (the parent of this file's
# directory), not the process's current working directory: this script is meant to
# be run both as `julia docs/check_rules.jl` from the repo root and `include()`d
# from docs/hs85_workflow.ipynb, whose cwd is docs/.
const REPO_ROOT = normpath(joinpath(@__DIR__, ".."))

# Static (text-based) checks: do not require loading the package, so they run even
# if the package fails to precompile.
function check_problem_static(problem::String)
  result = Dict{String, Any}()
  adnlp_path = joinpath(REPO_ROOT, "src", "ADNLPProblems", "$problem.jl")
  jump_path = joinpath(REPO_ROOT, "src", "PureJuMP", "$problem.jl")
  meta_path = joinpath(REPO_ROOT, "src", "Meta", "$problem.jl")

  # Check that the required files exist for the problem: ADNLPProblems, PureJuMP, and Meta.
  result["ADNLP"] = isfile(adnlp_path)
  result["PureJuMP"] = isfile(jump_path)
  result["Meta"] = isfile(meta_path)

  adnlp_text = result["ADNLP"] ? read(adnlp_path, String) : ""
  jump_text = result["PureJuMP"] ? read(jump_path, String) : ""
  meta_text = result["Meta"] ? read(meta_path, String) : ""

  # Check that the header comment of the PureJuMP file (the file that consistently
  # carries one across the repository) has a "Source" line in the first 20 lines,
  # so the origin of the problem is traceable.
  jump_lines = result["PureJuMP"] ? readlines(jump_path) : String[]
  result["Header"] =
    any(occursin("Source", jump_lines[i]) for i = 1:min(length(jump_lines), 20))

  # Check that the ADNLPProblems file defines an initial point (x0), and lower/upper
  # bounds (lvar/uvar) unless the Meta file explicitly says the problem has none.
  has_bounds_required = !occursin(":has_bounds => false", meta_text)
  result["Bounds"] =
    result["ADNLP"] &&
    occursin("x0", adnlp_text) &&
    (!has_bounds_required || (occursin("lvar", adnlp_text) && occursin("uvar", adnlp_text)))

  # Check that the Meta file names the problem, records a best known upper bound, and
  # defines every getter required by docs/src/contributing.md
  # (get_<name>_nvar/ncon/nlin/nnln/nequ/nineq).
  required_getters = ["nvar", "ncon", "nlin", "nnln", "nequ", "nineq"]
  missing_getters = [g for g in required_getters if !occursin("get_$(problem)_$(g)(", meta_text)]
  result["Metadata"] =
    result["Meta"] &&
    occursin(":name => \"$problem\"", meta_text) &&
    occursin(":best_known_upper_bound", meta_text) &&
    isempty(missing_getters)
  if !isempty(missing_getters)
    result["MissingGetters"] = missing_getters
  end

  # Check that the PureJuMP file does not mix the legacy nonlinear interface
  # (@NLobjective/@NLconstraint/@NLexpression) with the modern one
  # (@objective/@constraint/@expression): JuMP refuses to build a model that uses
  # both, so MathOptNLPModel(model) throws instead of failing a specific test.
  uses_legacy_macro =
    occursin("@NLobjective", jump_text) ||
    occursin("@NLconstraint", jump_text) ||
    occursin("@NLexpression", jump_text)
  result["JuMPInterfaceConsistent"] = result["PureJuMP"] && !uses_legacy_macro

  # Check that the objective/constraint closures in ADNLPProblems are not typed to a
  # concrete vector element type (e.g. `x::AbstractVector{T}`), which would prevent
  # ForwardDiff from calling them with Dual-typed vectors and break grad()/jacobian().
  result["ADNLPGenericSignatures"] =
    result["ADNLP"] && !occursin(r"\([^)]*::AbstractVector\{T\}", adnlp_text)

  # Reviewer markdown (optional, but useful for PR traceability).
  result["ReviewerMarkdown"] =
    isfile(joinpath(REPO_ROOT, "docs", "review_$problem.md")) ||
    isfile(joinpath(REPO_ROOT, "docs", "review", "$problem.md"))

  return result
end

# Whether OptimizationProblems and its test dependencies can be loaded, computed once.
const HAVE_DYNAMIC = try
  @eval using OptimizationProblems, ADNLPModels, NLPModelsJuMP, NLPModels
  true
catch err
  @warn "Dynamic checks unavailable: could not load OptimizationProblems/ADNLPModels/NLPModelsJuMP/NLPModels ($err)"
  false
end

# Dynamic checks: instantiate the actual models. These catch what static text checks
# cannot, e.g. a JuMP model that throws on construction, or an ADNLPProblems model
# whose objective/constraints numerically disagree with its PureJuMP sibling.
function check_problem_dynamic(problem::String)
  out = Dict{String, Any}()
  if !HAVE_DYNAMIC
    out["Allocation"] = "skipped (package unavailable)"
    out["Compatibility"] = "skipped (package unavailable)"
    return out
  end
  prob = Symbol(problem)
  ad_mod = OptimizationProblems.ADNLPProblems
  jump_mod = OptimizationProblems.PureJuMP

  if !isdefined(ad_mod, prob)
    out["Allocation"] = "skipped (no ADNLPProblems.$problem)"
  else
    try
      nlp = getfield(ad_mod, prob)(matrix_free = true)
      if nlp.meta.nnln > 0
        x = nlp.meta.x0
        cx = similar(x, nlp.meta.nnln)
        NLPModels.cons_nln!(nlp, x, cx)
        nbytes = @allocated NLPModels.cons_nln!(nlp, x, cx)
        out["Allocation"] = nbytes == 0 ? "pass (0 bytes)" : "warn ($(nbytes) bytes)"
      else
        out["Allocation"] = "n/a (no nonlinear constraints)"
      end
    catch err
      out["Allocation"] = "error: $err"
    end
  end

  if !isdefined(ad_mod, prob) || !isdefined(jump_mod, prob)
    out["Compatibility"] = "skipped (missing ADNLPProblems or PureJuMP implementation)"
  else
    try
      nlp_ad = getfield(ad_mod, prob)(matrix_free = true)
      model = getfield(jump_mod, prob)()
      nlp_jump = NLPModelsJuMP.MathOptNLPModel(model; name = problem)
      x0 = nlp_ad.meta.x0

      failures = String[]
      nlp_jump.meta.nvar == nlp_ad.meta.nvar || push!(failures, "nvar mismatch")
      nlp_jump.meta.x0 == nlp_ad.meta.x0 || push!(failures, "x0 mismatch")
      nlp_jump.meta.ncon == nlp_ad.meta.ncon || push!(failures, "ncon mismatch")
      isapprox(NLPModels.obj(nlp_ad, x0), NLPModels.obj(nlp_jump, x0), rtol = 1e-6) ||
        push!(failures, "objective mismatch at x0")
      if nlp_ad.meta.ncon > 0 && nlp_jump.meta.ncon == nlp_ad.meta.ncon
        nlp_ad.meta.lcon ≈ nlp_jump.meta.lcon || push!(failures, "lcon mismatch")
        nlp_ad.meta.ucon ≈ nlp_jump.meta.ucon || push!(failures, "ucon mismatch")
        all(isapprox.(NLPModels.cons(nlp_ad, x0), NLPModels.cons(nlp_jump, x0), atol = 1e-6)) ||
          push!(failures, "cons() mismatch at x0")
        nlp_ad.meta.lin == nlp_jump.meta.lin || push!(failures, "lin (linear constraint indices) mismatch")
      end
      out["Compatibility"] = isempty(failures) ? "pass" : "fail: " * join(failures, "; ")
    catch err
      out["Compatibility"] = "error: $err"
    end
  end
  return out
end

function check_problem(problem::String)
  result = check_problem_static(problem)
  merge!(result, check_problem_dynamic(problem))
  # Solving with Ipopt is not run automatically; left for manual reviewer attention.
  result["IpoptSolve"] = "manual"
  return result
end

function main()
  problems = isempty(ARGS) ? ["hs85", "hs89"] : ARGS
  results = Dict()
  for p in problems
    results[p] = check_problem(p)
  end
  println(JSON.json(results, 2))
end

if abspath(PROGRAM_FILE) == @__FILE__
  main()
end
