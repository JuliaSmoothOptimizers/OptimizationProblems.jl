# Compare against CUTEst
import CUTEst
const problems_cutest = CUTEst.select()

using OptimizationProblems, NLPModels, JuMP, NLPModelsJuMP

path = joinpath(dirname(@__DIR__), "src")
files = filter(readdir(path)) do filename
    endswith(filename, ".jl") && filename ∉ ("OptimizationProblems.jl", "template.jl")
end

struct Status
    samenvars::Bool
    samexval::Bool
    sameobjval::Bool
    samegradval::Bool
end

cutest_problem(name) = CUTEst.CUTEstModel(name)

function optpr_problem(name, args...)
    fmodel = getfield(OptimizationProblems, Symbol(name))
    model = fmodel(args...)
    return MathProgNLPModel(model)
end

function compute_status(probname; showvals=false)
    cutenlp = cutest_problem(uppercase(probname))
    optnlp = optpr_problem(probname)
    samenvars, samexval, sameobjval, samegradval = true, true, true, true
    isok = false
    if isa(optnlp.meta.x0, AbstractVector)
        n = cutenlp.meta.nvar
        if optnlp.meta.nvar != n
            samenvars = false
            optnlp = optpr_problem(probname, n)
        end
        if !(optnlp.meta.x0 ≈ cutenlp.meta.x0)
            samexval = false
        end
        x0 = optnlp.meta.x0
        if !(obj(cutenlp, x0) ≈ obj(optnlp, x0))
            sameobjval = false
            showvals && @show obj(cutenlp, x0) obj(d, x0)
        end
        if !(grad(cutenlp, x0) ≈ grad(optnlp, x0))
            samegradval = false
            showvals && @show [grad(cutenlp, x0) grad(d, x0)]
        end
        isok = true
    end
    finalize(cutenlp)
    return isok ? Status(samenvars, samexval, sameobjval, samegradval) : nothing
end

problem_status = Dict{String,Any}()

for file in files
    probname = splitext(file)[1]
    probname == "power" && continue  # NLPModelsJuMP gives an OutOfMemoryError on this one
    uprobname = uppercase(probname)
    if uprobname ∈ problems_cutest
        println("Testing ", probname)
        status = compute_status(probname)
        if isa(status, Status)
            problem_status[probname] = status
        else
            @warn("$probname didn't have vector x0, skipping")
        end
    else
        @warn("skipping $probname")
    end
end

if all(status->status == Status(true,true,true,true), problem_status)
    println("All problems agree")
else
    println("There are discrepancies, in # of dimensions, starting point, and/or objective/gradient, in the following problems:")
    discrepancies = filter(status->status != Status(true,true,true,true), problem_status)
    println(sort(collect(keys(discrepancies))))
end
