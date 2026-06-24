export hs202

function hs202(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs202(Val(model); kwargs...)
end

function hs202(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    t1 = -13 + x[1] + ((5 - x[2]) * x[2] - 2) * x[2]
    t2 = -29 + x[1] + ((1 + x[2]) * x[2] - 14) * x[2]
    return t1^2 + t2^2
  end
  x0 = T[15, -2]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs202"; kwargs...)
end

function hs202(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function F!(r, x)
    r[1] = -13 + x[1] + ((5 - x[2]) * x[2] - 2) * x[2]
    r[2] = -29 + x[1] + ((1 + x[2]) * x[2] - 14) * x[2]
    return r
  end
  x0 = T[15, -2]
  return ADNLPModels.ADNLSModel!(F!, x0, 2, name = "hs202-nls"; kwargs...)
end
