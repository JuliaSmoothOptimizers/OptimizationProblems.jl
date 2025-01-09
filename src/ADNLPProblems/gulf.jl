export gulf

function gulf(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return gulf(Val(model); kwargs...)
end

function gulf(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  m::Int = 100,
  kwargs...,
) where {T}
  m = min(m, 100)
  function f(x; m = m)
    return 1 // 2 * sum(
      (
        exp(-abs((25 + (-50 * log(i * one(T) / 100))^(2 // 3)) * m * i * x[2])^x[3] / x[1]) -
        i // 100
      )^2 for i = 1:m
    )
  end
  x0 = T[5, 2.5, 0.15]
  return ADNLPModels.ADNLPModel(f, x0, name = "gulf"; kwargs...)
end

function gulf(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  m::Int = 100,
  kwargs...,
) where {T}
  m = min(m, 100)

  function F!(r, x; m = m)
    for i = 1:m
      r[i] =
        exp(-abs((25 + (-50 * log(i * one(T) / 100))^(2 // 3)) * m * i * x[2])^x[3] / x[1]) -
        i // 100
    end
    return r
  end
  x0 = T[5, 2.5, 0.15]
  return ADNLPModels.ADNLSModel!(F!, x0, m, name = "gulf-nls"; kwargs...)
end
