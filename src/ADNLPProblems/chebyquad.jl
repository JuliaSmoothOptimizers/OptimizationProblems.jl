export chebyquad

function chebyquad(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return chebyquad(Val(model); kwargs...)
end

function Cheby(xj::Ti, i) where {Ti}
  return (xj ≥ 1) * cosh(i * acosh(max(abs(xj), 1))) + (xj ≤ -1) * (-one(Ti))^(i) * cosh(i * acosh(max(abs(xj), 1))) + (abs(xj) ≤ 1) * cos(i * acos(min(max(xj, -1), 1)))
end

function chebyquad(
  ::Val{:nlp};
  n::Int = default_nvar,
  m::Int = n,
  type::Val{T} = Val(Float64),
  chebyshev = Cheby,
  kwargs...,
) where {T}
  m = max(m, n)
  function f(x; n = length(x), m = m, chebyshev = chebyshev)
    return 1 // 2 * sum((1 // n * sum( chebyshev(x[j], 2i) for j=1:n) + 1 // ((2i)^2 - 1))^2 for i = 1:Int(round(m / 2))) + 1 // 2 * sum((1 // n * sum( chebyshev(x[j], 2i - 1)  for j=1:n))^2 for i = 1:(Int(round(m / 2)) + mod(n, 2)))
  end
  x0 = T[j // (n + 1) for j=1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "chebyquad"; kwargs...)
end

function chebyquad(
  ::Val{:nls};
  n::Int = default_nvar,
  m::Int = n,
  type::Val{T} = Val(Float64),
  chebyshev = Cheby,
  kwargs...,
) where {T}
  m = max(m, n)
  function F!(r, x; n = length(x), m = length(r), chebyshev = chebyshev)
    for i = 1:Int(round(m / 2))
      r[2i] = 1 // n * sum(
        (
          chebyshev(x[j], 2i)
        ) for j=1:n) + 1 // ((2i)^2 - 1)
      r[2i - 1] = 1 // n * sum(
        (
          chebyshev(x[j], 2i - 1)
        ) for j=1:n)
    end
    if mod(m, 2) == 1
      r[m] = 1 // n * sum(
        (
          chebyshev(x[j], m)
        ) for j=1:n)
    end
    return r
  end
  x0 = T[j // (n + 1) for j=1:n]
  return ADNLPModels.ADNLSModel!(F!, x0, m, name = "chebyquad-nls"; kwargs...)
end
