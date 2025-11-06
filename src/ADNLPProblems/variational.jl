export variational

function variational(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  h = 1 // (n + 1)

  x0 = Vector{T}(undef, n)
  for i = 1:n
    x0[i] = i * h * (one(T) - i * h)
  end

  f = (x; n = length(x)) -> begin
    S = eltype(x)
    hS = convert(S, h)

    xext = Vector{S}(undef, n + 2)
    xext[1] = zero(S)
    @inbounds for i = 1:n
      xext[i + 1] = x[i]
    end
    xext[n + 2] = zero(S)

    term1 = zero(S)
    @inbounds for i = 1:n
      xi = x[i]
      xip1 = xext[i + 2]
      term1 += xi * (xi - xip1) / hS
    end

    term2 = zero(S)
    @inbounds for j = 0:n
      a = xext[j + 1]
      b = xext[j + 2]
      d = b - a
      Pd = one(d) + d / 2 + d^2 / 6 + d^3 / 24 + d^4 / 120
      term = exp(a) * Pd
      term2 += term
    end
    return 2 * (term1 + n * (hS / 2) * term2)
  end

  return ADNLPModels.ADNLPModel(f, x0, name = "variational", minimize = true; kwargs...)
end
