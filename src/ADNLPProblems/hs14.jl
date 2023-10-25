export hs14

function hs14(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs14(Val(model); kwargs...)
end

function hs14(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  x0 = T[2; 2]
  f(x) = 1 // 2 * (x[1] - 2)^2 + 1 // 2 * (x[2] - 1)^2
  function c!(cx, x)
    cx[1] = x[1]^2 / 4 + x[2]^2 - 1
    return cx
  end
  lcon = T[-1; -Inf]
  ucon = T[-1; 0]

  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    [1; 1],
    [1; 2],
    T[1; -2],
    c!,
    lcon,
    ucon,
    name = "hs14";
    kwargs...,
  )
end

function hs14(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  x0 = T[2; 2]
  function F!(r, x)
    r[1] = x[1] - 2
    r[2] = x[2] - 1
    return r
  end
  function c!(cx, x)
    cx[1] = x[1]^2 / 4 + x[2]^2 - 1
    return cx
  end
  lcon = T[-1; -Inf]
  ucon = T[-1; 0]

  return ADNLPModels.ADNLSModel!(
    F!,
    x0,
    2,
    [1; 1],
    [1; 2],
    T[1; -2],
    c!,
    lcon,
    ucon,
    name = "hs14-nls";
    kwargs...,
  )
end
