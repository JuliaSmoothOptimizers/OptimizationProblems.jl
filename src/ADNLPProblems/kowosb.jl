export kowosb

function kowosb(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n = 4
  m = 11
  y = [
    1957 // 10000,
    1947 // 10000,
    1735 // 10000,
    1600 // 10000,
    844 // 10000,
    627 // 10000,
    456 // 10000,
    342 // 10000,
    323 // 10000,
    235 // 10000,
    246 // 10000,
  ]
  u = [
    4,
    2,
    1,
    1 // 2,
    1 // 4,
    167 // 1000,
    125 // 1000,
    1 // 10,
    833 // 1000,
    714 // 10000,
    625 // 10000,
  ]
  function f(x; m = m, y = y, u = u)
    return sum(
      (y[i] - (x[1] * (u[i]^2 + u[i] * x[2])) / (u[i]^2 + u[i] * x[3] + x[4]))^2 for i = 1:m
    )
  end
  x0 = T[0.25, 0.39, 0.415, 0.39]
  return ADNLPModels.ADNLPModel(f, x0, name = "kowosb"; kwargs...)
end
