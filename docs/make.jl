ENV["GKSwstype"] = "100"
using Documenter, OptimizationProblems

makedocs(
  modules = [OptimizationProblems],
  doctest = true,
  # linkcheck = true,
  strict = true,
  format = Documenter.HTML(
    assets = ["assets/style.css"],
    prettyurls = get(ENV, "CI", nothing) == "true",
  ),
  sitename = "OptimizationProblems.jl",
  pages = Any[
    "Home" => "index.md",
    "Tutorial" => "tutorial.md",
    "Problem classification" => "meta.md",
    "Benchmark" => "benchmark.md",
    "Reference" => "reference.md",
    "Contributing" => "contributing.md",
  ],
)

deploydocs(
  repo = "github.com/JuliaSmoothOptimizers/OptimizationProblems.jl.git",
  push_preview = true,
  devbranch = "main",
)
