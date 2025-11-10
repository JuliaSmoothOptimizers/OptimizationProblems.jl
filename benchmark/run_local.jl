using Pkg
Pkg.activate("benchmark")
Pkg.instantiate()
using Logging, JLD2, Dates

path = dirname(@__FILE__)
skip_tune = true

@info "INITIALIZE"
include("benchmarks.jl")

list_of_benchmark = keys(SUITE)
for benchmark_in_suite in list_of_benchmark
  @info "$(benchmark_in_suite)"
end

@info "TUNE"
if !skip_tune
  @time with_logger(ConsoleLogger(Error)) do
    tune!(SUITE)
    BenchmarkTools.save("params.json", params(suite))
  end
else
  @info "Skip tuning"
  # https://juliaci.github.io/BenchmarkTools.jl/dev/manual/
  BenchmarkTools.DEFAULT_PARAMETERS.evals = 1
end

@info "RUN"
@time result = with_logger(ConsoleLogger(Error)) do
  if "params.json" in (path == "" ? readdir() : readdir(path))
    loadparams!(suite, BenchmarkTools.load("params.json")[1], :evals, :samples)
  end
  run(SUITE, verbose = true)
end

@info "SAVE BENCHMARK RESULT"
name = "$(today())_optimizationproblems_benchmark"
BenchmarkTools.save("$name.json", result)
