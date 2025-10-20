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
  λ₁ = one(T)
  λ₂ = one(T)
  λ₃ = one(T)
  function f(x; n = length(x))
    s_exp = zero(T)
    s_sq = zero(T)
    p = one(T)
    @inbounds for j in 1:n
      s_exp += exp(x[j])
      s_sq += x[j]^2
      p *= x[j]
    end
    return λ₁ * s_exp + λ₂ * s_sq + λ₃ * (p - one(T))^2
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "auglag"; kwargs...)
end
