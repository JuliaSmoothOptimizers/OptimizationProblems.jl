module ADNLPProblems

using ADNLPModels, LinearAlgebra
import ..PureJuMP

default_nvar = 100

path = dirname(@__FILE__)
files = filter(x -> x[(end - 2):end] == ".jl", readdir(path))
for file in files
  if file ≠ "ADNLPProblems.jl"
    include(file)
    name = split(file, ".")[1]
    eval(Meta.parse("export $(name)"))
  end
end

end
