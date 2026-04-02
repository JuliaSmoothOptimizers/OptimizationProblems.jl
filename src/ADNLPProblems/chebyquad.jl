export chebyquad

function chebyquad(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return chebyquad(Val(model); kwargs...)
end

function Cheby(xj, i)
    eps = 1e-12  # Small tolerance for floating-point/AD noise
    xj_clamped = min(max(xj, -1), 1)
    pos = xj >= 1 - eps
    neg = xj <= -1 + eps
    # Always clamp argument to acosh to at least 1 (or -1)
    acosh_arg_pos = max(abs(xj), 1)
    acosh_arg_neg = max(abs(xj), 1)
    return ifelse(pos,
        cosh(i * acosh(acosh_arg_pos)),
        ifelse(neg,
            (-1)^i * cosh(i * acosh(acosh_arg_neg)),
            cos(i * acos(xj_clamped))
        )
    )
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
    return 0.5 * sum(
      (1 / n * sum(chebyshev(x[j], 2i) for j = 1:n) + 1 / ((2i)^2 - 1))^2 for
      i = 1:Int(round(m / 2))
    ) +
           0.5 * sum(
      (1 / n * sum(chebyshev(x[j], 2i - 1) for j = 1:n))^2 for i = 1:(Int(round(m / 2)) + mod(n, 2))
    )
  end
  x0 = [j / (n + 1) for j = 1:n]
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
    for i = 1:Int(round(m / 2))
      r[2i] = 1 / n * sum(chebyshev(x[j], 2i) for j = 1:n) + 1 / ((2i)^2 - 1)
      r[2i - 1] = 1 / n * sum(chebyshev(x[j], 2i - 1) for j = 1:n)
    end
    if mod(m, 2) == 1
      r[m] = 1 / n * sum(chebyshev(x[j], m) for j = 1:n)
    end
    return r
  end
  x0 = [j / (n + 1) for j = 1:n]
  return ADNLPModels.ADNLSModel!(F!, x0, m, name = "chebyquad-nls"; kwargs...)
end

