export bdqrtic

function bdqrtic(;use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return bdqrtic(Val(model); kwargs...)
end

function bdqrtic(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 5 && @warn("bdqrtic: number of variables must be ≥ 5")
  n = max(5, n)
  function f(x; n = length(x))
    return 1 // 2 * sum(
      (3 - 4 * x[i])^2 + (x[i]^2 + 2 * x[i + 1]^2 + 3 * x[i + 2]^2 + 4 * x[i + 3]^2 + 5 * x[n]^2)^2
      for i = 1:(n - 4)
    )
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "bdqrtic"; kwargs...)
end

function bdqrtic(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 5 && @warn("bdqrtic: number of variables must be ≥ 5")
  n = max(5, n)
  function F!(r, x; n = length(x))
    for i = 1:(n - 4)
      r[i] = 3 - 4 * x[i]
      r[i + n - 4] = x[i]^2 + 2 * x[i + 1]^2 + 3 * x[i + 2]^2 + 4 * x[i + 3]^2 + 5 * x[n]^2
    end
    return r
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, 2 * (n - 4), name = "bdqrtic-nls"; kwargs...)
end
