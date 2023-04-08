export hs30

function hs30(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs30(Val(model); kwargs...)
end

function hs30(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 1 // 2 * sum(x[i]^2 for i = 1:3)
  end
  x0 = ones(T, 3)
  lvar = T[1, -10, -10]
  uvar = T[10, 10, 10]
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2 - 1
    return cx
  end
  lcon = zeros(T, 1)
  ucon = [T(Inf)]
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs30"; kwargs...)
end

function hs30(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function F!(r, x)
    r .= x
    return r
  end
  x0 = ones(T, 3)
  lvar = T[1, -10, -10]
  uvar = T[10, 10, 10]
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2 - 1
    return cx
  end
  lcon = zeros(T, 1)
  ucon = [T(Inf)]
  return ADNLPModels.ADNLSModel!(
    F!,
    x0,
    3,
    lvar,
    uvar,
    c!,
    lcon,
    ucon,
    name = "hs30-nls";
    kwargs...,
  )
end
