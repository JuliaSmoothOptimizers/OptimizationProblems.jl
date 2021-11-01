module OptimizationProblems

include("ADNLPProblems/ADNLPProblems.jl")
include("PureJuMP/PureJuMP.jl")

export PureJuMP, ADNLPProblems

files = filter(x -> x[(end - 2):end] == ".jl", readdir("src/Meta"))
for file in files, i = 1:number_of_problems
  include("src/Meta/" * file)
end

end # module
