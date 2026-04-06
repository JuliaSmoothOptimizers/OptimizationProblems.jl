export chebyquad

function chebyquad(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return chebyquad(Val(model); kwargs...)
end

function Cheby(xj, i::Integer)
  # Evaluate T_i(x) via recurrence to avoid domain-branching and AD/tracer issues.
  if i == 0
    return one(xj)
  elseif i == 1
    return xj
  end

  tk_minus_1 = one(xj)
  tk = xj
  for _ = 2:i
    tk_plus_1 = 2 * xj * tk - tk_minus_1
    tk_minus_1 = tk
    tk = tk_plus_1
  end
  return tk
end

function chebyquad(
  ::Val{:nlp};
  n::Int = default_nvar,
  m::Int = n,
  type::Type{T} = Float64,
  chebyshev = Cheby,
  kwargs...,
) where {T}
  m = max(m, n)
  function f(x; n = length(x), m = m, chebyshev = chebyshev)
    return (one(T) / 2) * sum(
      ((one(T) / n) * sum(chebyshev(x[j], 2i) for j = 1:n) + one(T) / ((2i)^2 - 1))^2 for
      i = 1:div(m, 2)
    ) +
           (one(T) / 2) * sum(
      ((one(T) / n) * sum(chebyshev(x[j], 2i - 1) for j = 1:n))^2 for i = 1:div(m + 1, 2)
    )
  end
  x0 = Vector{T}(undef, n)
  for j = 1:n
    x0[j] = j * one(T) / (n + one(T))
  end
  return ADNLPModels.ADNLPModel(f, x0, name = "chebyquad"; kwargs...)
end

function chebyquad(
  ::Val{:nls};
  n::Int = default_nvar,
  m::Int = n,
  type::Type{T} = Float64,
  chebyshev = Cheby,
  kwargs...,
) where {T}
  m = max(m, n)
  function F!(r, x; n = length(x), m = length(r), chebyshev = chebyshev)
    for i = 1:div(m, 2)
      r[2i] = (one(T) / n) * sum(chebyshev(x[j], 2i) for j = 1:n) + one(T) / ((2i)^2 - 1)
      r[2i - 1] = (one(T) / n) * sum(chebyshev(x[j], 2i - 1) for j = 1:n)
    end
    if mod(m, 2) == 1
      r[m] = (one(T) / n) * sum(chebyshev(x[j], m) for j = 1:n)
    end
    return r
  end
  x0 = Vector{T}(undef, n)
  for j = 1:n
    x0[j] = j * one(T) / (n + one(T))
  end
  return ADNLPModels.ADNLSModel!(F!, x0, m, name = "chebyquad-nls"; kwargs...)
end

