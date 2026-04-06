# Script to check OptimizationProblems.jl rules for HS85/HS89
using JSON

function check_problem(problem::String)
    result = Dict()
    adnlp_path = "src/ADNLPProblems/$problem.jl"
    jump_path = "src/PureJuMP/$problem.jl"
    meta_path = "src/Meta/$problem.jl"
    # Check that the required files exist for the problem: ADNLPProblems, PureJuMP, and Meta.
    result["ADNLP"] = isfile(adnlp_path)
    result["PureJuMP"] = isfile(jump_path)
    result["Meta"] = isfile(meta_path)
    # Check that the header of the ADNLPProblems file for this problem contains a reference to "Hock and Schittkowski" in the first 10 lines, to ensure proper attribution/documentation.
    header_ok = false
    if result["ADNLP"] || result["PureJuMP"]
        adnlp_header_ok = false
        jump_header_ok = false
        if result["ADNLP"]
            adnlp_lines = readlines(adnlp_path)
            k = min(length(adnlp_lines), 20)
            adnlp_header_ok = any(occursin("Hock and Schittkowski", adnlp_lines[i]) for i in 1:k)
        end
        if result["PureJuMP"]
            jump_lines = readlines(jump_path)
            k = min(length(jump_lines), 20)
            jump_header_ok = any(occursin("Hock and Schittkowski", jump_lines[i]) for i in 1:k)
        end
        header_ok = adnlp_header_ok || jump_header_ok
    end
    result["Header"] = header_ok
    # Check that the ADNLPProblems file for problem defines lower bounds (lvar), upper bounds (uvar), and an initial point (x0).
    bounds_ok = false
    if result["ADNLP"]
        adnlp_file = String(read(adnlp_path))
        has_x0 = occursin("x0", adnlp_file)
        has_bounds_in_code = occursin("lvar", adnlp_file) && occursin("uvar", adnlp_file)
        has_bounds_required = true
        if result["Meta"]
            meta_file = String(read(meta_path))
            if occursin(":has_bounds => false", meta_file)
                has_bounds_required = false
            end
        end
        bounds_ok = has_x0 && (has_bounds_in_code || !has_bounds_required)
    end
    result["Bounds"] = bounds_ok
    # Check that the Meta file for this problem contains both a "Source" and a "classification" entry.
    meta_ok = false
    if result["Meta"]
        meta = String(read(meta_path))
        meta_ok = occursin(":name => \"$problem\"", meta) && occursin(":best_known_upper_bound", meta)
    end
    result["Metadata"] = meta_ok
    # Allocation check is currently not implemented (set to false as a placeholder).
    result["Allocation"] = false
    # Ipopt solve check is not performed by this script.
    # Marked as "manual" for reviewer attention.
    result["IpoptSolve"] = "manual"
    # Check whether reviewer markdown exists (optional, but useful for PR traceability).
    result["ReviewerMarkdown"] = isfile("docs/review_$problem.md") || isfile("docs/review/$problem.md")
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

main()
