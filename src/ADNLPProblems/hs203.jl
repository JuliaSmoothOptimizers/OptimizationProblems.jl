export hs203

function hs203(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs203(Val(model); kwargs...)
end

function hs203(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (3 // 2 - x[1] * (1 - x[2]))^2 +
           (9 // 4 - x[1] * (1 - x[2]^2))^2 +
           (21 // 8 - x[1] * (1 - x[2]^3))^2
  end
  x0 = T[2, 1 // 5]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs203"; kwargs...)
end

function hs203(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function F!(r, x)
    r[1] = 3 // 2 - x[1] * (1 - x[2])
    r[2] = 9 // 4 - x[1] * (1 - x[2]^2)
    r[3] = 21 // 8 - x[1] * (1 - x[2]^3)
    return r
  end
  x0 = T[2, 1 // 5]
  return ADNLPModels.ADNLSModel!(F!, x0, 3, name = "hs203-nls"; kwargs...)
end
