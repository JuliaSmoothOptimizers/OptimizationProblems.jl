export biggs6

function biggs6(;
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  m::Int = 13,
  kwargs...,
) where {T}
  m = max(6, m)
  z = [i // 10 for i = 1:m]
  y = [exp(-zi) - 5 * exp(-10 * zi) + 3 * exp(-4 * zi) for zi in z]
  f(x) = sum(
    x[3] * exp(-x[1] * z[i]) - x[4] * exp(-x[2] * z[i]) + x[6] * exp(-x[5] * z[i]) - y[i] for
    i = 1:m
  )
  x0 = ones(T, 6)
  x0[2] = 2
  return ADNLPModels.ADNLPModel(f, x0, name = "biggs6"; kwargs...)
end
