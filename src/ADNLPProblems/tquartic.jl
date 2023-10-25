export tquartic

function tquartic(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return tquartic(Val(model); kwargs...)
end

function tquartic(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  n < 2 && @warn("tquartic: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x; n = length(x))
    return 1 // 2 * (x[1] - 1)^2 + 1 // 2 * sum((x[1]^2 - x[i + 1]^2)^2 for i = 1:(n - 2))
  end
  x0 = T(0.1) * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "tquartic"; kwargs...)
end

function tquartic(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  n < 2 && @warn("tquartic: number of variables must be ≥ 2")
  n = max(2, n)
  function F!(r, x; n = length(x))
    r[1] = x[1] - 1
    for i = 1:(n - 2)
      r[i + 1] = x[1]^2 - x[i + 1]^2
    end
    return r
  end
  x0 = T(0.1) * ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, n - 1, name = "tquartic-nls"; kwargs...)
end
