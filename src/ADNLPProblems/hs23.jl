export hs23

function hs23(;use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs23(Val(model); kwargs...)
end

function hs23(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 1 // 2 * x[1]^2 + 1 // 2 * x[2]^2
  end
  x0 = T[3, 1]
  lvar = -50 * ones(T, 2)
  uvar = 50 * ones(T, 2)
  function c(x)
    n = length(x)
    return [x[1]^2 + x[2]^2 - 1, 9 * x[1]^2 + x[2]^2 - 9, x[1]^2 - x[2], x[2]^2 - x[1]]
  end
  lcon = vcat(one(T), zeros(T, 4))
  ucon = T(Inf) * ones(T, 5)
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    [1; 1],
    [1; 2],
    T[1; 1],
    c,
    lcon,
    ucon,
    name = "hs23";
    kwargs...,
  )
end

function hs23(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function F!(r, x)
    r[1] = x[1]
    r[2] = x[2]
    return r
  end
  x0 = T[3, 1]
  lvar = -50 * ones(T, 2)
  uvar = 50 * ones(T, 2)
  function c!(cx, x)
    cx[1] = x[1]^2 + x[2]^2 - 1
    cx[2] = 9 * x[1]^2 + x[2]^2 - 9
    cx[3] = x[1]^2 - x[2]
    cx[4] = x[2]^2 - x[1]
    return cx
  end
  lcon = vcat(one(T), zeros(T, 4))
  ucon = T(Inf) * ones(T, 5)
  return ADNLPModels.ADNLSModel!(
    F!,
    x0,
    2,
    lvar,
    uvar,
    [1; 1],
    [1; 2],
    T[1; 1],
    c!,
    lcon,
    ucon,
    name = "hs23-nls";
    kwargs...,
  )
end
