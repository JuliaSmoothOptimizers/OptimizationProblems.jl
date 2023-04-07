export hs42

function hs42(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs42(Val(model); kwargs...)
end

function hs42(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x ->
      1 // 2 * (x[1] - 1)^2 + 1 // 2 * (x[2] - 2)^2 + 1 // 2 * (x[3] - 3)^2 + 1 // 2 * (x[4] - 4)^2,
    ones(T, 4),
    [1],
    [1],
    T[1],
    x -> [x[3]^2 + x[4]^2 - 2],
    T[2, 0],
    T[2, 0],
    name = "hs42";
    kwargs...,
  )
end

function hs42(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function F!(r, x)
    r[1] = x[1] - 1
    r[2] = x[2] - 2
    r[3] = x[3] - 3
    r[4] = x[4] - 4
    return r
  end
  function c!(cx, x)
    cx[1] = x[3]^2 + x[4]^2 - 2
    return cx
  end
  return ADNLPModels.ADNLSModel!(
    F!,
    ones(T, 4),
    4,
    [1],
    [1],
    T[1],
    c!,
    T[2, 0],
    T[2, 0],
    name = "hs42-nls";
    kwargs...,
  )
end
