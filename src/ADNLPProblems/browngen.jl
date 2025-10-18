export browngen
function browngen(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return browngen(Val(model); kwargs...)
end

function browngen(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    sx = zero(T)
    @inbounds for i in 1:n
      sx += x[i]
    end
    s = zero(T)
    @inbounds for i in 1:(n - 1)
      t = x[i] + sx - T(n + 1)
      s += t * t
    end
    p = one(T)
    @inbounds for i in 1:n
      p *= x[i]
    end
    t = p - one(T)
    return s + t * t
  end
  x0 = fill(T(0.5), n)
  return ADNLPModels.ADNLPModel(f, x0, name = "browngen"; kwargs...)
end

function browngen(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function F!(r, x)
    sx = zero(T)
    @inbounds for i in 1:n
      sx += x[i]
    end
    @inbounds for i in 1:(n - 1)
      r[i] = x[i] + sx - T(n + 1)
    end
    p = one(T)
    @inbounds for i in 1:n
      p *= x[i]
    end
    r[n] = p - one(T)
    return r
  end
  x0 = fill(T(0.5), n)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "browngen-nls"; kwargs...)
end
