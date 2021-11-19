module OptimizationProblems

include("ADNLPProblems/ADNLPProblems.jl")
include("PureJuMP/PureJuMP.jl")

default_nvar = ADNLPProblems.default_nvar

export PureJuMP, ADNLPProblems

path = dirname(@__FILE__)
files = filter(x -> x[(end - 2):end] == ".jl", readdir(path * "/Meta"))
for file in files
  include("Meta/" * file)
end

end # module
