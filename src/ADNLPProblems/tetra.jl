# Minimize the sum of the inverse weighted mean ratio of the elements in a fixed–boundary
# tetrahedral mesh by adjusting the locations of the free vertices.

#  This is problem 19 in the COPS (Version 3) collection of 
#   E. Dolan and J. More
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

include("../../data/tetra.jl")
export tetra

function tetra(
  x0 = xe_tetra,
  TETS::Vector{Int64} = Tets_tetra,
  Const::Vector{Int64} = Constants_tetra;
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  x0 = T.(x0)
  n = length(x0)
  τ = 0
  N = round(Int, n / 3)
  E = round(Int, length(TETS) / 4)

  function area(e, x)
    return sum(
      (x[TETS[e + E] + N * i] - x[TETS[e] + N * i]) *
      (
        (x[TETS[e + 2 * E] + N * mod(i + 1, 3)] - x[TETS[e] + N * mod(i + 1, 3)]) *
        (x[TETS[e + 3 * E] + N * mod(i - 1, 3)] - x[TETS[e] + N * mod(i - 1, 3)]) -
        (x[TETS[e + 2 * E] + N * mod(i - 1, 3)] - x[TETS[e] + N * mod(i - 1, 3)]) *
        (x[TETS[e + 3 * E] + N * mod(i + 1, 3)] - x[TETS[e] + N * mod(i + 1, 3)])
      ) *
      eltype(x)(sqrt(2)) for i = 0:2
    )
  end
  function nfrob(e, x)
    return sum(
      (1 * x[TETS[e + E] + N * i] - x[TETS[e] + N * i])^2 +
      (2 * x[TETS[e + 2 * E] + N * i] - x[TETS[e + E] + N * i] - x[TETS[e] + N * i])^2 / 3 +
      (
        3 * x[TETS[e + 3 * E] + N * i] - x[TETS[e + 2 * E] + N * i] - x[TETS[e + E] + N * i] -
        x[TETS[e] + N * i]
      )^2 / 6 for i = 0:2
    )
  end

  function f(y; E = E)
    return sum(nfrob(e, y) / (3 * area(e, y)^(2 // 3)) for e = 1:E)
  end
  function c!(cx, y)
    for e = 1:E
      cx[e] = area(e, y)
    end
    return cx
  end

  lvar = -T(Inf) * ones(T, n)
  lvar[Const] = x0[Const]
  lvar[Const .+ N] = x0[Const .+ N]
  lvar[Const .+ 2 * N] = x0[Const .+ 2 * N]

  uvar = T(Inf) * ones(T, n)
  uvar[Const] = x0[Const]
  uvar[Const .+ N] = x0[Const .+ N]
  uvar[Const .+ 2 * N] = x0[Const .+ 2 * N]

  lcon = τ * ones(T, E)
  ucon = T(Inf) * ones(T, E)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "tetra"; kwargs...)
end

export tetra_duct12
function tetra_duct12(; kwargs...)
  _ensure_data!(:tetra_duct12, "tetra_duct12.jl")
  xe   = Base.invokelatest(getfield, @__MODULE__, :xe_duct12)
  TETS = Base.invokelatest(getfield, @__MODULE__, :TETS_duct12)
  Const= Base.invokelatest(getfield, @__MODULE__, :Const_duct12)
  tetra(xe, TETS, Const; name = "tetra_duct12", kwargs...)
end

export tetra_duct15
function tetra_duct15(; kwargs...)
  _ensure_data!(:tetra_duct15, "tetra_duct15.jl")
  xe   = Base.invokelatest(getfield, @__MODULE__, :xe_duct15)
  TETS = Base.invokelatest(getfield, @__MODULE__, :TETS_duct15)
  Const= Base.invokelatest(getfield, @__MODULE__, :Const_duct15)
  tetra(xe, TETS, Const; name = "tetra_duct15", kwargs...)
end

export tetra_duct20
function tetra_duct20(; kwargs...)
  _ensure_data!(:tetra_duct20, "tetra_duct20.jl")
  xe   = Base.invokelatest(getfield, @__MODULE__, :xe_duct20)
  TETS = Base.invokelatest(getfield, @__MODULE__, :TETS_duct20)
  Const= Base.invokelatest(getfield, @__MODULE__, :Const_duct20)
  tetra(xe, TETS, Const; name = "tetra_duct20", kwargs...)
end

export tetra_hook
function tetra_hook(; kwargs...)
  _ensure_data!(:tetra_hook, "tetra_hook.jl")
  xe   = Base.invokelatest(getfield, @__MODULE__, :xe_hook)
  TETS = Base.invokelatest(getfield, @__MODULE__, :TETS_hook)
  Const= Base.invokelatest(getfield, @__MODULE__, :Const_hook)
  tetra(xe, TETS, Const; name = "tetra_hook", kwargs...)
end

export tetra_foam5
function tetra_foam5(; kwargs...)
  _ensure_data!(:tetra_foam5, "tetra_foam5.jl")
  xe   = Base.invokelatest(getfield, @__MODULE__, :xe_foam5)
  TETS = Base.invokelatest(getfield, @__MODULE__, :TETS_foam5)
  Const= Base.invokelatest(getfield, @__MODULE__, :Const_foam5)
  tetra(xe, TETS, Const; name = "tetra_foam5", kwargs...)
end

export tetra_gear
function tetra_gear(; kwargs...)
  _ensure_data!(:tetra_gear, "tetra_gear.jl")
  xe   = Base.invokelatest(getfield, @__MODULE__, :xe_gear)
  TETS = Base.invokelatest(getfield, @__MODULE__, :TETS_gear)
  Const= Base.invokelatest(getfield, @__MODULE__, :Const_gear)
  tetra(xe, TETS, Const; name = "tetra_gear", kwargs...)
end
