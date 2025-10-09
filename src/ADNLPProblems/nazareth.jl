export nazareth

function nazareth(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return nazareth(Val(model); kwargs...)
end

function nazareth(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    s = zero(T)
    @inbounds for i = 1:n
      t = sin(x[i]) - T(0.1)
      s += t * t
    end
    return s
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "nazareth", minimize = true; kwargs...)
end

function nazareth(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function F!(r, x; n = length(x))
    @inbounds for i = 1:n
      r[i] = sin(x[i]) - T(0.1)
    end
    return r
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "nazareth"; kwargs...)
end

