export AMPGO08

function AMPGO08(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return -(
      1 * cos(2 * x[1] + 1) +
      2 * cos(3 * x[1] + 2) +
      3 * cos(4 * x[1] + 3) +
      4 * cos(5 * x[1] + 4) +
      5 * cos(6 * x[1] + 5) +
      6 * cos(7 * x[1] + 6)
    )
  end
  x0 = T[-10]
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO08"; kwargs...)
end
