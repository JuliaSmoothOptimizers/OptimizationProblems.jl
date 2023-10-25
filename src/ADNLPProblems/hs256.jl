export hs256

function hs256(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (x[1] + 10 * x[2])^2 + 5 * (x[3] - x[4])^2 + (x[2] - 2 * x[3])^4 + 10 * (x[1] - x[4])^4
  end
  x0 = T[3, -1, 0, 1]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs256"; kwargs...)
end
