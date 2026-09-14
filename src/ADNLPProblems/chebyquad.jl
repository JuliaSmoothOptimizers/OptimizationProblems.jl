export chebyquad

function chebyquad(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return chebyquad(Val(model); kwargs...)
end

function _cheby_recurrence(xj, i::Integer)
  i == 0 && return one(xj)
  i == 1 && return xj
  tk_prev = one(xj)
  tk = xj
  for _ = 2:i
    tk_next = 2 * xj * tk - tk_prev
    tk_prev = tk
    tk = tk_next
  end
  return tk
end

function chebyquad(::Val{:nlp}; n::Int = default_nvar, m::Int = n, type::Type{T} = Float64, kwargs...) where {T}
  m = max(m, n)
  function f(x; n = length(x))
    inv_n = one(eltype(x)) / n
    s = zero(eltype(x))
    for i = 1:div(m + 1, 2)
      acc = zero(eltype(x))
      for j = 1:n
        acc += _cheby_recurrence(x[j], 2i - 1)
      end
      ri = inv_n * acc
      s += ri * ri
    end
    for i = 1:div(m, 2)
      acc = zero(eltype(x))
      for j = 1:n
        acc += _cheby_recurrence(x[j], 2i)
      end
      ri = inv_n * acc + one(eltype(x)) / ((2i)^2 - 1)
      s += ri * ri
    end
    return s / 2
  end
  x0 = [j * one(T) / (n + one(T)) for j = 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "chebyquad"; kwargs...)
end

function chebyquad(::Val{:nls}; n::Int = default_nvar, m::Int = n, type::Type{T} = Float64, kwargs...) where {T}
  m = max(m, n)
  function F!(r, x)
    n = length(x)
    m = length(r)
    inv_n = one(eltype(x)) / n
    for i = 1:div(m, 2)
      acc_odd = zero(eltype(x))
      acc_even = zero(eltype(x))
      for j = 1:n
        acc_odd += _cheby_recurrence(x[j], 2i - 1)
        acc_even += _cheby_recurrence(x[j], 2i)
      end
      r[2i - 1] = inv_n * acc_odd
      r[2i] = inv_n * acc_even + one(eltype(x)) / ((2i)^2 - 1)
    end
    if isodd(m)
      acc = zero(eltype(x))
      for j = 1:n
        acc += _cheby_recurrence(x[j], m)
      end
      r[m] = inv_n * acc
    end
    return r
  end
  x0 = [j * one(T) / (n + one(T)) for j = 1:n]
  return ADNLPModels.ADNLSModel!(F!, x0, m, name = "chebyquad-nls"; kwargs...)
end
