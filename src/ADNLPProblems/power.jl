export power

function power(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return power(Val(model); kwargs...)
end

function power(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    return 1 // 2 * (sum((i * x[i]^2) for i = 1:n))^2
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "power"; kwargs...)
end

function power(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function F!(r, x; n = length(x))
    r[1] = sum((i * x[i]^2) for i = 1:n)
    return r
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, 1, name = "power-nls"; kwargs...)
end
