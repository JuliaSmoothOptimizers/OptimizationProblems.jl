module PureJuMP

const default_nvar = 100
const data_path = joinpath(@__DIR__, "..", "..", "data")

const _data_loaded = Dict{Symbol,Ref{Bool}}()
const _data_locks  = Dict{Symbol,ReentrantLock}()

function _ensure_data!(key::Symbol, relpath::AbstractString)
    flag = get!(_data_loaded, key, Ref(false))
    flag[] && return
    lck  = get!(_data_locks,  key, ReentrantLock())
    lock(lck) do
        flag[] && return
        Base.include(@__MODULE__, joinpath(@__DIR__, "..", "..", "data", relpath))
        flag[] = true
    end
    return
end

using JuMP, LinearAlgebra, SpecialFunctions

path = dirname(@__FILE__)
files = filter(x -> x[(end - 2):end] == ".jl", readdir(path))
for file in files
  if file ≠ "PureJuMP.jl"
    include(file)
  end
end

end
