export Duscube

function Duscube(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[1]^3 - (x[1] - 4)^2 - 100 * x[1]
  end
  x0 = ones(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "Duscube"; kwargs...)
end
