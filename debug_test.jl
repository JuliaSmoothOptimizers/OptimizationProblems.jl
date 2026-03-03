using Distributed

np = max(1, Sys.CPU_THREADS ÷ 2)
addprocs(np - 1)

@everywhere using NLPModels, NLPModelsJuMP, OptimizationProblems
@everywhere import ADNLPModels

@everywhere function defined_names(mod::Module)
  [n for n in names(mod) if isdefined(mod, n)]
end

@everywhere const list_problems =
  setdiff(union(defined_names(ADNLPProblems), defined_names(PureJuMP)), [:PureJuMP, :ADNLPProblems])

# Fetch from worker 2
list_probs = @fetchfrom 2 list_problems
meta_probs = Symbol.(OptimizationProblems.meta[!, :name])

println("List problems (from worker 2): ", length(list_probs))
println("Meta problems: ", length(meta_probs))

only_list = setdiff(list_probs, meta_probs)
only_meta = setdiff(meta_probs, list_probs)

println("\nOnly in list_problems: ", only_list)
println("Only in meta: ", only_meta)

println("\nFirst 10 from list: ", sort(collect(list_probs))[1:10])
println("First 10 from meta: ", sort(collect(meta_probs))[1:10])

println("\nLast 10 from list: ", sort(collect(list_probs))[end-9:end])
println("Last 10 from meta: ", sort(collect(meta_probs))[end-9:end])
