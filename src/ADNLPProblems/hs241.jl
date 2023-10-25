export hs241

function hs241(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (x[1]^2 + x[2]^2 + x[3]^2 - 1)^2 +
           (x[1]^2 + x[2]^2 + (x[3] - 2)^2 - 1)^2 +
           (x[1] + x[2] + x[3] - 1)^2 +
           (x[1] + x[2] - x[3] + 1)^2 +
           (x[1]^3 + 3 * x[2]^2 + (5 * x[3] - x[1] + 1)^2 - 36)^2
  end
  x0 = T[1, 2, 0]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs241"; kwargs...)
end
