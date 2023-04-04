export freuroth

function freuroth(;use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return freuroth(Val(model); kwargs...)
end

function freuroth(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 2 && @warn("freuroth: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x; n = length(x))
    return 1 // 2 * sum(((5 - x[i + 1]) * x[i + 1]^2 + x[i] - 2 * x[i + 1] - 13)^2 for i = 1:(n - 1)) +
           1 // 2 * sum(((1 + x[i + 1]) * x[i + 1]^2 + x[i] - 14 * x[i + 1] - 29)^2 for i = 1:(n - 1))
  end

  x0 = zeros(T, n)
  x0[1] = one(T) / 2
  x0[2] = -2 * one(T)
  return ADNLPModels.ADNLPModel(f, x0, name = "freuroth"; kwargs...)
end

function freuroth(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 2 && @warn("freuroth: number of variables must be ≥ 2")
  n = max(2, n)
  function F!(r, x; n = length(x))
    for i = 1:(n - 1)
      r[i] = (5 - x[i + 1]) * x[i + 1]^2 + x[i] - 2 * x[i + 1] - 13
      r[i + n - 1] = (1 + x[i + 1]) * x[i + 1]^2 + x[i] - 14 * x[i + 1] - 29
    end
    return r
  end

  x0 = zeros(T, n)
  x0[1] = one(T) / 2
  x0[2] = -2 * one(T)
  return ADNLPModels.ADNLSModel!(F!, x0, 2 * (n - 1), name = "freuroth-nls"; kwargs...)
end
