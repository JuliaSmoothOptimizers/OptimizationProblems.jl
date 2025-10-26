module ADNLPProblems

using Requires

const default_nvar = 100
const data_path = joinpath(@__DIR__, "..", "..", "data")

reshape_array(a, dims) = invoke(Base._reshape, Tuple{AbstractArray, typeof(dims)}, a, dims)

const _data_loaded = Dict{Symbol, Ref{Bool}}()
const _data_locks = Dict{Symbol, ReentrantLock}()

function _ensure_data!(key::Symbol, relpath::AbstractString)
  flag = get!(_data_loaded, key, Ref(false))
  flag[] && return
  lck = get!(_data_locks, key, ReentrantLock())
  lock(lck) do
    flag[] && return
    Base.include(@__MODULE__, joinpath(@__DIR__, "..", "..", "data", relpath))
    flag[] = true
  end
  return
end

@init begin
  @require ADNLPModels = "54578032-b7ea-4c30-94aa-7cbd1cce6c9a" begin
    using JLD2, LinearAlgebra, SparseArrays, SpecialFunctions

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
