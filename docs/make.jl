ENV["GKSwstype"] = "100"
using Documenter, OptimizationProblems

makedocs(
  modules = [OptimizationProblems],
  doctest = true,
  linkcheck = true,
  format = Documenter.HTML(
    assets = ["assets/style.css"],
    prettyurls = get(ENV, "CI", nothing) == "true",
    size_threshold_ignore = ["reference.md", "meta.md"],
  ),
  sitename = "OptimizationProblems.jl",
  pages = [
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
