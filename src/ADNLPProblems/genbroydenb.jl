export genbroydenb

function genbroydenb(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return genbroydenb(Val(model); kwargs...)
end

function genbroydenb(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  p = 7 // 3
  function f(x; n = length(x))
    s = zero(T)
    for i = 1:n
      diag = (2 + 5 * x[i]^2) * x[i] + 1
      neigh = zero(T)
      @inbounds for j = max(1, i - 5):min(n, i + 1)
        if j != i
          neigh += x[j] * (1 + x[j])
        end
      end
      s += abs(diag + neigh)^p
    end
    return s
  end
  x0 = fill(-one(T), n)
  return ADNLPModels.ADNLPModel(f, x0, name = "genbroydenb", minimize = true; kwargs...)
end

function genbroydenb(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  p = 7 // 6
  function F!(r, x)
    m = length(x)
    @inbounds for i = 1:m
      diag = (2 + 5 * x[i]^2) * x[i] + 1
      neigh = zero(T)
      for j = max(1, i - 5):min(m, i + 1)
        if j != i
          neigh += x[j] * (1 + x[j])
        end
      end
      z = diag + neigh
      r[i] = abs(z)^(p)
    end
    return r
  end
x0 = fill(-one(T), n)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "genbroydenb-nls"; kwargs...)
end
