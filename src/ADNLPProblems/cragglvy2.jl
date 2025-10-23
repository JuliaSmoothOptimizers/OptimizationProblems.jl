export cragglvy2

function cragglvy2(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return cragglvy2(Val(model); kwargs...)
end

function cragglvy2(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n < 2 && @warn("cragglvy2: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x; n = length(x))
    return sum(
      (exp(x[2 * i - 1]) - x[2 * i])^4 +
      100 * (x[2 * i] - x[2 * i + 1])^6 +
      (tan(x[2 * i + 1] - x[2 * i + 2]))^4 +
      x[2 * i - 1]^8 +
      (x[2 * i + 2] - 1)^2 for i = 1:(div(n, 2) - 1)
    )
  end
  x0 = vcat(1, 2 * ones(T, n - 1))
  return ADNLPModels.ADNLPModel(f, x0, name = "cragglvy2"; kwargs...)
end

function cragglvy2(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n < 2 && @warn("cragglvy2: number of variables must be ≥ 2")
  n = max(2, n)
  function F!(r, x; n = length(x))
    for i = 1:(div(n, 2) - 1)
      r[2 * i - 1] = (exp(x[2 * i - 1]) - x[2 * i])^2
      r[2 * i] = 10 * (x[2 * i] - x[2 * i + 1])^4
      r[2 * i + 1] = tan(x[2 * i + 1] - x[2 * i + 2])
      r[2 * i + 2] = x[2 * i + 2] - 1
    end
    return r
  end
  x0 = vcat(T(1), T(2) * ones(T, n - 1))
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "cragglvy2-nls"; kwargs...)
end
