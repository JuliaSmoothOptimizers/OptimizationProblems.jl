export camshape

function camshape(args...; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  R_min = 1
  R_max = 2
  R_v = 1
  α = 15 // 10
  θ = T(2 * pi / (5 * (n + 1)))
  function f(y)
    Ti = eltype(y)
    return -Ti(R_v * pi / n) * sum(y[i] for i = 1:n)
  end
  function c!(cx, y::V; n = n, R_max = R_max, R_min = R_min, θ = eltype(y)(θ)) where {V}
    cx[1] = R_max - y[n]
    cx[2] = y[1] - R_min
    for i = 1:(n - 1)
      cx[2 + i] = y[i + 1] - y[i]
    end
    cx[n + 2] = -R_min * y[1] - y[1] * y[2] + 2 * R_min * y[2] * cos(θ)
    cx[n + 3] = -R_min^2 - R_min * y[1] + 2 * R_min * y[1] * cos(θ)
    cx[n + 4] = -y[n - 1] * y[n] - y[n] * R_max + 2 * y[n - 1] * R_max * cos(θ)
    cx[n + 5] = -2 * R_max * y[n] + 2 * y[n]^2 * cos(θ)
    for i = 2:(n - 1)
      cx[n + 4 + i] = -y[i - 1] * y[i] - y[i] * y[i + 1] + 2 * y[i - 1] * y[i + 1] * cos(θ)
    end
    return cx
  end

  lvar = T(R_min) * ones(T, n)
  uvar = T(R_max) * ones(T, n)
  lcon = vcat(T(-α * θ) * ones(T, n + 1), -T(Inf) * ones(T, n + 2))
  ucon = vcat(T(α * θ) * ones(T, n + 1), zeros(T, n + 2))
  x0 = T((R_min + R_max) / 2) * ones(T, n)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "camshape", ; kwargs...)
end
