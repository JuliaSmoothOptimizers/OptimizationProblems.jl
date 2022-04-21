export gaussian

function gaussian(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    y = T[
      0.0009,
      0.0044,
      0.0175,
      0.054,
      0.1295,
      0.242,
      0.3521,
      0.3989,
      0.3521,
      0.242,
      0.1295,
      0.054,
      0.0175,
      0.0044,
      0.0009,
    ]
    return sum((x[1] * exp(-x[2] / 2 * (T(8 - i) / 2 - x[3])^2) - y[i])^2 for i = 1:15)
  end
  x0 = T[0.4, 1, 0]
  return ADNLPModels.ADNLPModel(f, x0, name = "gaussian"; kwargs...)
end
