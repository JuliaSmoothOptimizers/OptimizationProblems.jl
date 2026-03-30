# Script to check OptimizationProblems.jl rules for HS85/HS89
using JSON

function check_problem(problem::String)
    result = Dict()
    # Check that the required files exist for the problem: ADNLPProblems, PureJuMP, and Meta.
    result["ADNLP"] = isfile("src/ADNLPProblems/$problem.jl")
    result["PureJuMP"] = isfile("src/PureJuMP/$problem.jl")
    result["Meta"] = isfile("src/Meta/$problem.md")
    # Check that the header of the ADNLPProblems file for this problem contains a reference to "Hock and Schittkowski" in the first 10 lines, to ensure proper attribution/documentation.
    header_ok = false
    if result["ADNLP"]
        header = readlines("src/ADNLPProblems/$problem.jl")[1:10]
        header_ok = any(occursin("Hock and Schittkowski", h) for h in header)
    end
    result["Header"] = header_ok
    # Check that the ADNLPProblems file for problem defines lower bounds (lvar), upper bounds (uvar), and an initial point (x0).bounds_ok = false
    if result["ADNLP"]
        file = String(read("src/ADNLPProblems/$problem.jl"))
        bounds_ok = occursin("lvar", file) && occursin("uvar", file) && occursin("x0", file)
    end
    result["Bounds"] = bounds_ok
    # Check that the Meta file for this problem contains both a "Source" and a "classification" entry.
    meta_ok = false
    if result["Meta"]
        meta = String(read("src/Meta/$problem.md"))
        meta_ok = occursin("Source", meta) && occursin("classification", meta)
    end
    result["Metadata"] = meta_ok
    # Allocation check is currently not implemented (set to false as a placeholder).
    result["Allocation"] = false
    # Ipopt solve check is not performed by this script.
    # Marked as "manual" for reviewer attention.
    result["IpoptSolve"] = "manual"
    # Check that a reviewer markdown file exists for this problem in docs/review_$problem.md.
    result["ReviewerMarkdown"] = isfile("docs/review_$problem.md")
    return result
end

function main()
    problems = ["hs85", "hs89"]
    results = Dict()
    for p in problems
        results[p] = check_problem(p)
    end
    println(JSON.json(results))
end

main()
