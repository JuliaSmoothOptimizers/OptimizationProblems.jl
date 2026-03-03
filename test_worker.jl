using Distributed
addprocs(1)

@everywhere begin
    using Pkg
    Pkg.activate(".")
end

@everywhere using OptimizationProblems
@everywhere import ADNLPModels

@everywhere function defined_names(mod::Module)
    [n for n in names(mod) if isdefined(mod, n)]
end

@everywhere const list_problems =
    setdiff(union(defined_names(ADNLPProblems), defined_names(PureJuMP)), [:PureJuMP, :ADNLPProblems])

# Fetch from worker
worker_list = @fetchfrom 2 list_problems
main_list = list_problems

println("Worker count: ", length(worker_list))
println("Main count: ", length(main_list))

# Get meta
meta_list = Symbol.(OptimizationProblems.meta[!, :name])
println("Meta count: ", length(meta_list))

# Check dembo problems
worker_dembos = filter(x -> startswith(string(x), "dembo"), collect(worker_list))
main_dembos = filter(x -> startswith(string(x), "dembo"), collect(main_list))
meta_dembos = filter(x -> startswith(x, "dembo"), string.(meta_list))

println("\nWorker dembo problems: ", sort(worker_dembos))
println("Main dembo problems: ", sort(main_dembos))
println("Meta dembo problems: ", sort(meta_dembos))

# Show differences
only_in_worker = setdiff(worker_list, meta_list)
only_in_meta = setdiff(meta_list, worker_list)

println("\nOnly in worker list: ", sort(collect(only_in_worker)))
println("Only in meta: ", sort(collect(only_in_meta)))
