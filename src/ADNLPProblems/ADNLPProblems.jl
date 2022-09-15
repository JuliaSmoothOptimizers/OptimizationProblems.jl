module ADNLPProblems

using Requires

default_nvar = 100

reshape_array(a, dims) = invoke(Base._reshape, Tuple{AbstractArray, typeof(dims)}, a, dims)

@init begin
  @require ADNLPModels = "54578032-b7ea-4c30-94aa-7cbd1cce6c9a" begin
    using LinearAlgebra, SparseArrays

    path = dirname(@__FILE__)
    files = filter(x -> x[(end - 2):end] == ".jl", readdir(path))
    for file in files
      if file ≠ "ADNLPProblems.jl"
        include(file)
      end
    end
  end
end

end
