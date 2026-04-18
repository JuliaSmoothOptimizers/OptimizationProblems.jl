export catenary

function catenary(
  args...;
  n::Int = default_nvar,
  type::Type{T} = Float64,
  Bl = 1,
  FRACT = 0.6,
  kwargs...,
) where {T}
  n_orig = n
  n = 3 * max(1, div(n, 3))
  n = max(n, 6)
  @adjust_nvar_warn("catenary", n_orig, n)

  ## Model Parameters
  N = div(n, 3) - 2
  d = Bl * (N + 1) * FRACT

  gamma = 9.81
  tmass = 500.0
  mass = tmass / (N + 1)
  mg = T(gamma * mass)

  function f(x; N = N, mg = mg)
    return mg * x[2] / 2 + sum(mg * x[2 + 3 * i] for i = 1:N) + mg * x[5 + 3 * N] / 2
  end

  function c!(cx, x; N = N, Bl = Bl)
    for i = 1:(N + 1)
      cx[i] =
        (x[1 + 3 * i] - x[-2 + 3 * i])^2 +
        (x[2 + 3 * i] - x[-1 + 3 * i])^2 +
        (x[3 + 3 * i] - x[3 * i])^2
    end
    return cx
  end

  lvar = T(-Inf) * ones(T, n)
  uvar = T(Inf) * ones(T, n)
  lvar[1:3] .= T(0)
  uvar[1:3] .= T(0)
  lvar[n - 2] = T(d)
  uvar[n - 2] = T(d)

  lcon = zeros(T, N + 1) .+ Bl^2
  ucon = zeros(T, N + 1) .+ Bl^2
  x0 = zeros(T, n)

  for i = 0:(N + 1)
    x0[1 + 3 * i] = T(i * d / (N + 1))
    x0[2 + 3 * i] = T(-i * d / (N + 1))
  end

  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "catenary"; kwargs...)
end
