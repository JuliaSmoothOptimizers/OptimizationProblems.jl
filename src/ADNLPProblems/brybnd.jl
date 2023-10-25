export brybnd

function brybnd(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return brybnd(Val(model); kwargs...)
end

function brybnd(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    ml = 5
    mu = 1
    return 1 // 2 * sum(
      (
        x[i] * (2 + 5 * x[i]^2) + 1 -
        sum(x[j] * (1 + x[j]) for j = max(1, i - ml):min(n, i + mu) if j != i)
      )^2 for i = 1:n
    )
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "brybnd"; kwargs...)
end

function brybnd(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function F!(r, x; n = length(x))
    ml = 5
    mu = 1
    for i = 1:n
      r[i] =
        x[i] * (2 + 5 * x[i]^2) + 1 -
        sum(x[j] * (1 + x[j]) for j = max(1, i - ml):min(n, i + mu) if j != i)
    end
    return r
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "brybnd-nls"; kwargs...)
end
