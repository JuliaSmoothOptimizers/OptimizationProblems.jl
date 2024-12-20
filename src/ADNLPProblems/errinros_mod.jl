export errinros_mod

function errinros_mod(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return errinros_mod(Val(model); kwargs...)
end

function errinros_mod(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  n < 2 && @warn("errinros_mod: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x; n = length(x))
    return 1 // 2 * sum((x[i - 1] - 16 * x[i]^2 * (15 // 10 + eltype(x)(sin(i)))^2)^2 for i = 2:n) +
           1 // 2 * sum((1 - x[i])^2 for i = 2:n)
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "errinros_mod"; kwargs...)
end

function errinros_mod(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  n < 2 && @warn("errinros_mod: number of variables must be ≥ 2")
  n = max(2, n)
  function F!(r::AbstractVector{Ti}, x; n = length(x)) where {Ti}
    for i = 2:n
      r[i - 1] = x[i - 1] - 16 * x[i]^2 * (15 // 10 + sin(i * one(Ti)))^2
      r[i - 1 + n - 1] = 1 - x[i]
    end
    return r
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, 2 * (n - 1), name = "errinros_mod-nls"; kwargs...)
end
