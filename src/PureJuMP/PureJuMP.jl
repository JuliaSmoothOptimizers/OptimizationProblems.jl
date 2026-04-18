module PureJuMP

const default_nvar = 100
const data_path = joinpath(@__DIR__, "..", "..", "data")

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

using JuMP, LinearAlgebra, SpecialFunctions

_adjust_nvar_warn_message(problem_name, n_orig, n) =
  string(problem_name, ": number of variables adjusted from ", n_orig, " to ", n)

macro adjust_nvar_warn(problem_name, n_orig, n)
  return quote
    local _n_orig = $(esc(n_orig))
    local _n = $(esc(n))
    (_n == _n_orig) || @warn(_adjust_nvar_warn_message($(esc(problem_name)), _n_orig, _n))
  end
end

path = dirname(@__FILE__)
files = filter(x -> x[(end - 2):end] == ".jl", readdir(path))
for file in files
  if file ≠ "PureJuMP.jl"
    include(file)
  end
end

end
