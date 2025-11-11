export variational

function variational(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  h = 1 // (n + 1)
  x0 = [convert(T, (i * h) * (1 - i * h)) for i = 1:n]

  function f(x)
    term1 = zero(T)
    for i = 1:n
      xi = x[i]
      xip = (i < n) ? x[i + 1] : zero(T)
      term1 += xi * (xi - xip) / h
    end

    term2 = zero(T)
    for j = 0:n
      a = (j == 0) ? zero(T) : x[j]
      b = (j == n) ? zero(T) : x[j + 1]
      term2 += (exp(b) - exp(a)) / (b - a)
    end

    return 2 * (term1 + n * (h / 2) * term2)
  end

  return ADNLPModels.ADNLPModel(f, x0, name = "variational"; kwargs...)
end
