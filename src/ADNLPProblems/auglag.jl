export auglag

function auglag(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return auglag(Val(model); kwargs...)
end

function auglag(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  nequ = n + 1
  function F!(r, x; n = length(x))
    @inbounds for i in 1:n
      r[i] = x[i] - one(T)
    end
    # r[n+1] = sum(x) - n
    s = zero(T)
    @inbounds for i in 1:n
      s += x[i]
    end
    r[n + 1] = s - T(n)
    return r
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, nequ, name = "auglag-nls"; kwargs...)
end

function auglag(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    # f(x) = Σ (x[i]-1)^2 + (Σ x[i] - n)^2
    s1 = zero(T)
    @inbounds for i in 1:n
      s1 += (x[i] - one(T))^2
    end
    s2 = zero(T)
    @inbounds for i in 1:n
      s2 += x[i]
    end
    return s1 + (s2 - T(n))^2
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "auglag"; kwargs...)
end
