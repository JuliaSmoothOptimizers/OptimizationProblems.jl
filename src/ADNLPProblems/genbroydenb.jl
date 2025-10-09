export genbroydenb

function genbroydenb(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return genbroydenb(Val(model); kwargs...)
end

function genbroydenb(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, ml::Int = 5, mu::Int = 1, beta::Real = 5.0, kwargs...) where {T}
  b = T(beta)
  function f(x; n = length(x))
    s = zero(T)
    for i = 1:n
      diag = x[i] * (T(2) + b * x[i]^2) + one(T)
      neigh = zero(T)
      for j = max(1, i - ml):min(n, i + mu)
        if j != i
          neigh += x[j] * (one(T) + x[j])
        end
      end
      s += (diag - neigh)^2
    end
    return T(0.5) * s
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "genbroydenb"; kwargs...)
end

function genbroydenb(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, ml::Int = 5, mu::Int = 1, beta::Real = 5.0, kwargs...) where {T}
  b = T(beta)
  function F!(r, x; n = length(x))
    for i = 1:n
      diag = x[i] * (T(2) + b * x[i]^2) + one(T)
      neigh = zero(T)
      for j = max(1, i - ml):min(n, i + mu)
        if j != i
          neigh += x[j] * (one(T) + x[j])
        end
      end
      r[i] = diag - neigh
    end
    return r
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "genbroydenb-nls"; kwargs...)
end
