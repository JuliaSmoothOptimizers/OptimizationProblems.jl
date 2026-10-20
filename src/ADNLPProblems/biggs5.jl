export biggs5

function biggs5(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return biggs5(Val(model); kwargs...)
end

function biggs5(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  m::Int = 13,
  kwargs...,
) where {T}
  m = max(6, m)
  z = [i // 10 for i = 1:m]
  y = T[exp(-zi) - 5 * exp(-10 * zi) + 3 * exp(-4 * zi) for zi in z]
  function f(x; m = m, z = z, y = y)
    return sum(
      (x[3] * exp(-x[1] * z[i]) - x[4] * exp(-x[2] * z[i]) + x[6] * exp(-x[5] * z[i]) - y[i])^2 for
      i = 1:m
    )
  end
  x0 = ones(T, 6)
  x0[2] = 2
  x0[6] = 3
  lvar = vcat(-T(Inf) * ones(T, 5), T(3))
  uvar = vcat(T(Inf) * ones(T, 5), T(3))
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "biggs5"; kwargs...)
end

function biggs5(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  m::Int = 13,
  kwargs...,
) where {T}
  m = max(6, m)
  z = [i // 10 for i = 1:m]
  y = T[exp(-zi) - 5 * exp(-10 * zi) + 3 * exp(-4 * zi) for zi in z]
  function F!(r, x; m = m, z = z, y = y)
    for i = 1:m
      r[i] = x[3] * exp(-x[1] * z[i]) - x[4] * exp(-x[2] * z[i]) + x[6] * exp(-x[5] * z[i]) - y[i]
    end
    return r
  end
  x0 = ones(T, 6)
  x0[2] = 2
  x0[6] = 3
  lvar = vcat(-T(Inf) * ones(T, 5), T(3))
  uvar = vcat(T(Inf) * ones(T, 5), T(3))
  return ADNLPModels.ADNLSModel!(F!, x0, m, lvar, uvar, name = "biggs5-nls"; kwargs...)
end
