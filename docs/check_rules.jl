# Script to check OptimizationProblems.jl rules for HS85/HS89
using JSON

function check_problem(problem::String)
    result = Dict()
    # File structure
    result["ADNLP"] = isfile("src/ADNLPProblems/$problem.jl")
    result["PureJuMP"] = isfile("src/PureJuMP/$problem.jl")
    result["Meta"] = isfile("src/Meta/$problem.md")
    # Header
    header_ok = false
    if result["ADNLP"]
        header = readlines("src/ADNLPProblems/$problem.jl")[1:10]
        header_ok = any(occursin("Hock and Schittkowski", h) for h in header)
    end
    result["Header"] = header_ok
    # Bounds/x0
    bounds_ok = false
    if result["ADNLP"]
        file = String(read("src/ADNLPProblems/$problem.jl"))
        bounds_ok = occursin("lvar", file) && occursin("uvar", file) && occursin("x0", file)
    end
    result["Bounds"] = bounds_ok
    # Metadata
    meta_ok = false
    if result["Meta"]
        meta = String(read("src/Meta/$problem.md"))
        meta_ok = occursin("Source", meta) && occursin("classification", meta)
    end
    result["Metadata"] = meta_ok
    # Allocation (relaxed)
    result["Allocation"] = false
    # Ipopt solve (not checked here)
    result["IpoptSolve"] = "manual"
    # Reviewer markdown
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
