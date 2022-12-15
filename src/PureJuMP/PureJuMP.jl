module PureJuMP

const default_nvar = 100

using JuMP, LinearAlgebra, SpecialFunctions

path = dirname(@__FILE__)
files = filter(x -> x[(end - 2):end] == ".jl", readdir(path))
for file in files
  if file ≠ "PureJuMP.jl"
    include(file)
  end
end

end
