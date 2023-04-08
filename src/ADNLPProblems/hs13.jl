export hs13

function hs13(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs13(Val(model); kwargs...)
end

function hs13(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 1 // 2 * (x[1] - 2)^2 + 1 // 2 * x[2]^2
  end
  x0 = -2 * ones(T, 2)
  lvar = zeros(T, 2)
  uvar = T(Inf) * ones(T, 2)
  function c!(cx, x)
    cx[1] = (1 - x[1])^3 - x[2]
    return cx
  end
  lcon = zeros(T, 1)
  ucon = T(Inf) * ones(T, 1)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs13"; kwargs...)
end

function hs13(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function F!(r, x)
    r[1] = x[1] - 2
    r[2] = x[2]
    return r
  end
  x0 = -2 * ones(T, 2)
  lvar = zeros(T, 2)
  uvar = T(Inf) * ones(T, 2)
  function c!(cx, x)
    cx[1] = (1 - x[1])^3 - x[2]
    return cx
  end
  lcon = zeros(T, 1)
  ucon = T(Inf) * ones(T, 1)
  return ADNLPModels.ADNLSModel!(
    F!,
    x0,
    2,
    lvar,
    uvar,
    c!,
    lcon,
    ucon,
    name = "hs13-nls";
    kwargs...,
  )
end
