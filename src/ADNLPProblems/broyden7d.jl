export broyden7d

function broyden7d(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return broyden7d(Val(model); kwargs...)
end

function broyden7d(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    s = zero(T)
    @inbounds for i = 1:n
      s += x[i]^2
    end
    return T(0.5) * s
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "broyden7d"; kwargs...)
end

function broyden7d(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  # Provide an in-place residual F! for least-squares-style testing.
  function F!(r, x; n = length(x))
    @inbounds for i = 1:n
      r[i] = x[i]
    end
    return r
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "broyden7d-nls"; kwargs...)
end
