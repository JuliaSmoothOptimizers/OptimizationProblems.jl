export variational

function variational(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  h = 1 // (n + 1)
  x0 = T[(i * h) * (1 - i * h) for i = 1:n]

function f(x; n = length(x))
  Ti = eltype(x)

  term1 = zero(Ti)
  term2 = zero(Ti)
  @inbounds for k = 1:n
    xi  = x[k]
    xip = (k < n) ? x[k + 1] : zero(Ti)

    term1 += xi * (xi - xip) / h

    a_prev = (k == 1) ? zero(Ti) : x[k - 1]
    b_prev = xi
    term2 += (exp(b_prev) - exp(a_prev)) / (b_prev - a_prev)

    if k == n
      a_last, b_last = xi, zero(Ti)
      term2 += (exp(b_last) - exp(a_last)) / (b_last - a_last)
    end
  end
  return 2 * (term1 + 2 * h * term2)
end

  return ADNLPModels.ADNLPModel(f, x0, name = "variational"; kwargs...)
end
