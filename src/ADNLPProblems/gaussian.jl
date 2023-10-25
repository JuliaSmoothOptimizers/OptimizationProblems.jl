export gaussian

function gaussian(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return gaussian(Val(model); kwargs...)
end

function gaussian(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = [
    9 // 10000,
    44 // 10000,
    175 // 10000,
    54 // 1000,
    1295 // 10000,
    242 // 1000,
    3521 // 10000,
    3989 // 10000,
    3521 // 10000,
    242 // 1000,
    1295 // 10000,
    54 // 1000,
    175 // 10000,
    44 // 10000,
    9 // 10000,
  ]
  function f(x; y = y)
    return 1 // 2 * sum((x[1] * exp(-x[2] / 2 * ((8 - i) // 2 - x[3])^2) - y[i])^2 for i = 1:15)
  end
  x0 = T[0.4, 1, 0]
  return ADNLPModels.ADNLPModel(f, x0, name = "gaussian"; kwargs...)
end

function gaussian(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = [
    9 // 10000,
    44 // 10000,
    175 // 10000,
    54 // 1000,
    1295 // 10000,
    242 // 1000,
    3521 // 10000,
    3989 // 10000,
    3521 // 10000,
    242 // 1000,
    1295 // 10000,
    54 // 1000,
    175 // 10000,
    44 // 10000,
    9 // 10000,
  ]
  function F!(r, x; y = y)
    for i = 1:15
      r[i] = x[1] * exp(-x[2] / 2 * ((8 - i) // 2 - x[3])^2) - y[i]
    end
    return r
  end
  x0 = T[0.4, 1, 0]
  return ADNLPModels.ADNLSModel!(F!, x0, 15, name = "gaussian-nls"; kwargs...)
end
