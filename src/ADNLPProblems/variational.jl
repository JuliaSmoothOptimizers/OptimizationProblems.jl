export variational

function variational(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  h = 1 // (n + 1)
  x0 = [convert(T, i * h * (1 - i * h)) for i = 1:n]
  f =
    x -> begin
      xext = vcat(zero(eltype(x)), x, zero(eltype(x)))
      term1 = sum(x[i] * (x[i] - xext[i + 2]) / convert(eltype(x), h) for i = 1:n)
      term2 = sum(
        if eltype(x) <: AbstractFloat
          d = xext[j + 2] - xext[j + 1]
          abs(d) <= eps(eltype(x)) ? exp(xext[j + 1]) : (exp(xext[j + 2]) - exp(xext[j + 1])) / d
        else
          d = xext[j + 2] - xext[j + 1]
          exp(xext[j + 1]) * expm1(d) / d
        end for j = 0:n
      )
      return 2 * (term1 + n * (convert(eltype(x), h) / 2) * term2)
    end

  return ADNLPModels.ADNLPModel(f, x0, name = "variational", minimize = true; kwargs...)
end
