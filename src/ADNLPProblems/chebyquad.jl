export chebyquad

function chebyquad(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return chebyquad(Val(model); kwargs...)
end

function Cheby(xj, i)
    # Use standard Chebyshev definition with robust handling of tiny excursions:
    #   T_i(x) = cos(i * acos(x))          for |x| ≤ 1
    #   T_i(x) = cosh(i * acosh(x))        for x > 1
    #   T_i(x) = (-1)^i * cosh(i * acosh(-x)) for x < -1
    if xj > 1
        return cosh(i * acosh(xj))
    elseif xj < -1
        return (-1)^i * cosh(i * acosh(-xj))
    else
        # Clamp only for acos to guard against tiny floating-point/AD excursions.
        xj_clamped = min(max(xj, -1), 1)
        return cos(i * acos(xj_clamped))
    end
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
    inv_n = one(T) / n
    half = one(T) / 2
    return half * sum(
      (inv_n * sum(chebyshev(x[j], 2i) for j = 1:n) + one(T) / ((2i)^2 - 1))^2 for
      i = 1:div(m, 2)
    ) +
           half * sum(
      (inv_n * sum(chebyshev(x[j], 2i - 1) for j = 1:n))^2 for i = 1:div(m + 1, 2)
    )
  end
  step = one(T) / (n + one(T))
  x0 = Vector{T}(undef, n)
  for j = 1:n
    x0[j] = j * step
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
    inv_n = one(T) / n
    for i = 1:div(m, 2)
      r[2i] = inv_n * sum(chebyshev(x[j], 2i) for j = 1:n) + one(T) / ((2i)^2 - 1)
      r[2i - 1] = inv_n * sum(chebyshev(x[j], 2i - 1) for j = 1:n)
    end
    if mod(m, 2) == 1
      r[m] = inv_n * sum(chebyshev(x[j], m) for j = 1:n)
    end
    return r
  end
  step = one(T) / (n + one(T))
  x0 = Vector{T}(undef, n)
  for j = 1:n
    x0[j] = j * step
  end
  return ADNLPModels.ADNLSModel!(F!, x0, m, name = "chebyquad-nls"; kwargs...)
end

