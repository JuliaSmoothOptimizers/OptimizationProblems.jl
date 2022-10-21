export gaussian

function gaussian(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    y = [
      9 // 10000,
      44 // 10000,
      175 // 10000,
      54 // 1000,
      1295 // 10000,
      242 // 1000,
      3521 // 10000,
      3989 // 10000,
      3521 // 10000,
      242 // 1000,
      1295 // 10000,
      54 // 1000,
      175 // 10000,
      44 // 10000,
      9 // 10000,
    ]
    return sum((x[1] * exp(-x[2] / 2 * ((8 - i) // 2 - x[3])^2) - y[i])^2 for i = 1:15)
  end
  x0 = T[0.4, 1, 0]
  return ADNLPModels.ADNLPModel(f, x0, name = "gaussian"; kwargs...)
end
