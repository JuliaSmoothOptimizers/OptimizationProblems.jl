# See: https://plato.asu.edu/ftp/ampl-nlp.html

using Printf
using OptimizationProblems
import JuMP
import NLPModels: obj
import Ipopt

# Path to AMPL-NLP benchmark TXT (user must download manually)
AMPL_NLP_TXT = joinpath(@__DIR__, "ampl_nlp_benchmark.txt")

# Parse AMPL-NLP benchmark data from plain text
function load_ampl_nlp_benchmark_txt(path)
    if !isfile(path)
        error("AMPL-NLP benchmark TXT not found: $path\nPlease download from https://plato.asu.edu/ftp/ampl-nlp.html and save as ampl_nlp_benchmark.txt in benchmark/")
    end
    lines = readlines(path)
    data = []
    header_found = false
    for line in lines
        if occursin(r"^\s*hs", line) # start at first hs problem
            header_found = true
        end
        if header_found && !isempty(strip(line)) && !startswith(strip(line), "=")
            fields = split(strip(line))
            # Now expect: Problem nv nc IPOPT KNITRO SNOPT CONOPT WORHP FMINCON COPT UNO AMPL_OBJ
            if length(fields) >= 12
                push!(data, (
                    Problem=fields[1],
                    nv=parse(Int, fields[2]),
                    nc=parse(Int, fields[3]),
                    IPOPT=fields[4],
                    KNITRO=fields[5],
                    SNOPT=fields[6],
                    CONOPT=fields[7],
                    WORHP=fields[8],
                    FMINCON=fields[9],
                    COPT=fields[10],
                    UNO=fields[11],
                    AMPL_OBJ=parse(Float64, fields[12])
                ))
            end
        end
    end
    return data
end

# Map AMPL problem names to OptimizationProblems.jl names (add more as needed)
const AMPL_TO_OP = Dict(
    "hs001" => "hs1",
    "hs002" => "hs2",
    "hs010" => "hs10",
    "hs011" => "hs11",
    "hs012" => "hs12",
    "hs013" => "hs13",
    "hs014" => "hs14",
    "hs015" => "hs15",
    "hs016" => "hs16",
    "hs017" => "hs17",
    "hs018" => "hs18",
    "hs019" => "hs19",
    "hs020" => "hs20",
    "hs021" => "hs21",
    "hs022" => "hs22",
    "hs023" => "hs23",
    "hs024" => "hs24",
    "hs025" => "hs25",
    "hs100" => "hs100",
    "hs101" => "hs101",
    "hs102" => "hs102",
    "hs103" => "hs103",
    "hs104" => "hs104",
    "hs105" => "hs105",
    "hs106" => "hs106",
    "hs107" => "hs107",
    "hs108" => "hs108",
    "hs109" => "hs109",
    "hs110" => "hs110",
    "hs111" => "hs111",
    "hs112" => "hs112",
    "hs113" => "hs113",
    "hs114" => "hs114",
    "hs116" => "hs116",
    "hs117" => "hs117",
    "hs118" => "hs118",
    "hs119" => "hs119",
    "hs201" => "hs201",
    "hs211" => "hs211",
    "hs219" => "hs219",
    "hs220" => "hs220",
    "hs221" => "hs221",
    "hs222" => "hs222",
    "hs223" => "hs223",
    "hs224" => "hs224",
    "hs225" => "hs225",
    "hs226" => "hs226",
    "hs227" => "hs227",
    "hs228" => "hs228",
    "hs229" => "hs229",
)

# Run a problem and return objective value and status
using NLPModelsJuMP

function run_problem(probname; atol=1e-6, rtol=1e-6)
    try
        model = getfield(OptimizationProblems.PureJuMP, Symbol(probname))()
        # Extract starting point from JuMP model
        vars = JuMP.all_variables(model)
        x0 = [JuMP.start_value(v) for v in vars]
        nlp = MathOptNLPModel(model)
        objval0 = obj(nlp, x0)
        # Solve with Ipopt
        JuMP.set_optimizer(model, Ipopt.Optimizer)
        JuMP.optimize!(model)
        status = string(JuMP.termination_status(model))
        xsol = [JuMP.value(v) for v in vars]
        objval_sol = obj(nlp, xsol)
        return (objective0=objval0, objectivesol=objval_sol, status=status)
    catch e
        return (objective0=NaN, objectivesol=NaN, status=string(e))
    end
end

# Compare results and report discrepancies
function compare_with_benchmark(ampl_data; atol=1e-6, rtol=1e-6)
    println("Comparing OptimizationProblems.jl with AMPL-NLP benchmark (TXT)...")
    println(@sprintf("%-8s | IPOPT | AMPL obj value   | OP obj@x0         | OP obj@sol        | RelErr@x0 | RelErr@sol | Status", "AMPL"))
    println("---------------------------------------------------------------------------------------------------------------")
    results = []
    for row in ampl_data
        ampl_name = row.Problem
        op_name = get(AMPL_TO_OP, ampl_name, nothing)
        if isnothing(op_name)
            @info "No mapping for AMPL problem $ampl_name"
            continue
        end
        op_result = run_problem(op_name; atol=atol, rtol=rtol)
        op_obj0 = op_result.objective0
        op_objsol = op_result.objectivesol
        status = op_result.status
        ampl_obj = row.AMPL_OBJ
        relerr0 = isfinite(op_obj0) && isfinite(ampl_obj) ? abs(op_obj0 - ampl_obj) / (abs(ampl_obj) + atol) : NaN
        relerrsol = isfinite(op_objsol) && isfinite(ampl_obj) ? abs(op_objsol - ampl_obj) / (abs(ampl_obj) + atol) : NaN
        println(@sprintf("%-8s | %-5s | %16.10g | %16.10g | %16.10g | %8.2e | %8.2e | %s", ampl_name, row.IPOPT, ampl_obj, op_obj0, op_objsol, relerr0, relerrsol, status))
        push!(results, (AMPL=ampl_name, IPOPT=row.IPOPT, AMPL_OBJ=ampl_obj, OP_OBJ_X0=op_obj0, OP_OBJ_SOL=op_objsol, RELERR_X0=relerr0, RELERR_SOL=relerrsol, STATUS=status))
    end
    return results
end

function main()
    ampl_data = load_ampl_nlp_benchmark_txt(AMPL_NLP_TXT)
    results = compare_with_benchmark(ampl_data)

    write_results_md(results)
end

function write_results_md(results)
    mdfile = joinpath(@__DIR__, "compare_ampl_nlp_results.md")
    open(mdfile, "w") do io
        println(io, "# AMPL-NLP vs OptimizationProblems.jl Comparison Results\n")
        println(io, "| AMPL | IPOPT | AMPL obj value | OP obj@x0 | OP obj@sol | RelErr@x0 | RelErr@sol |")
        println(io, "|------|-------|----------------|-----------|------------|-----------|------------|")
        for r in results
            println(io, @sprintf("| %-6s | %-5s | %14.8g | %9.3g | %10.3g | %9.2e | %10.2e |", r.AMPL, r.IPOPT, r.AMPL_OBJ, r.OP_OBJ_X0, r.OP_OBJ_SOL, r.RELERR_X0, r.RELERR_SOL))
        end
    end
    println("Results written to compare_ampl_nlp_results.md")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end

# Write results to markdown file
function write_results_md(results)
    mdfile = joinpath(@__DIR__, "compare_ampl_nlp_results.md")
    open(mdfile, "w") do io
        println(io, "# AMPL-NLP vs OptimizationProblems.jl Comparison Results\n")
        println(io, "| AMPL | IPOPT | AMPL obj value | OP obj@x0 | OP obj@sol | RelErr@x0 | RelErr@sol | Status |")
        println(io, "|------|-------|----------------|-----------|------------|-----------|------------|--------|")
        for r in results
            println(io, @sprintf("| %-6s | %-5s | %14.8g | %9.3g | %10.3g | %9.2e | %10.2e | %s |", r.AMPL, r.IPOPT, r.AMPL_OBJ, r.OP_OBJ_X0, r.OP_OBJ_SOL, r.RELERR_X0, r.RELERR_SOL, r.STATUS))
        end
    end
    println("Results written to compare_ampl_nlp_results.md")
end
