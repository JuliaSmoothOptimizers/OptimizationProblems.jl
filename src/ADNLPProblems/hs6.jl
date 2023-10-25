export hs6

function hs6(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs6(Val(model); kwargs...)
end

function hs6(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function c!(cx, x)
    cx[1] = 10 * (x[2] - x[1]^2)
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    x -> 1 // 2 * (x[1] - 1)^2,
    T[-1.2; 1.0],
    c!,
    zeros(T, 1),
    zeros(T, 1),
    name = "hs6";
    kwargs...,
  )
end

function hs6(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function F!(r, x)
    r[1] = 1 // 2 * (x[1] - 1)^2
    return r
  end
  function c!(cx, x)
    cx[1] = 10 * (x[2] - x[1]^2)
    return cx
  end
  return ADNLPModels.ADNLSModel!(
    F!,
    T[-1.2; 1.0],
    1,
    c!,
    zeros(T, 1),
    zeros(T, 1),
    name = "hs6-nls";
    kwargs...,
  )
end
