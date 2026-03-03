#!/usr/bin/env julia
# Minimal test to verify dembo problems load correctly
cd("/home/arnav/Desktop/OptimizationProblems.jl")
push!(LOAD_PATH, "@.")

using OptimizationProblems

# Check meta
println("Total problems in meta: ", size(OptimizationProblems.meta, 1))

meta_names = String.(OptimizationProblems.meta[!, :name])
dembos = filter(x -> startswith(x, "dembo"), meta_names)

println("\nDembo problems in metadata:")
for n in sort(dembos)
    println("  ", n)
end

# Try importing ADNLPModels to trigger @require
try
    using Pkg
    Pkg.activate("test")
    import ADNLPModels
    using ADNLPModels
    
    println("\nADNLPProblems exports (sample):")
    adnlp_names = names(ADNLPProblems)
    dembo_names = filter(x -> startswith(string(x), "dembo"), adnlp_names)
    for n in sort(dembo_names)
        println("  ", n)
    end
    
    # Try to create one problem
    println("\nTrying to create dembo_gp2...")
    nlp = eval(:(ADNLPProblems.dembo_gp2()))
    println("  Success! n=", nlp.meta.nvar, ", m=", nlp.meta.ncon)
catch e
    println("\nError loading ADNLPProblems: ", e)
end
