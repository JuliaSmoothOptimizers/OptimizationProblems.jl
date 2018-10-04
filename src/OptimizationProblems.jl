module OptimizationProblems

using JuMP, Compat

path = dirname(@__FILE__)
files = filter(x->x[end-2:end] == ".jl", readdir(path))
for file in files
  if (file == "OptimizationProblems.jl") || (file == "template.jl"); continue; end
  include(file)
end

end # module
