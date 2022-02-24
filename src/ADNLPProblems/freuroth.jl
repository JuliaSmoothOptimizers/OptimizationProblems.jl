export freuroth

function freuroth(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 2 && @warn("freuroth: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x)
    n = length(x)
    return sum(((5 - x[i + 1]) * x[i + 1]^2 + x[i] - 2 * x[i + 1] - 13)^2 for i = 1:(n - 1)) +
           sum(((1 + x[i + 1]) * x[i + 1]^2 + x[i] - 14 * x[i + 1] - 29)^2 for i = 1:(n - 1))
  end

  x0 = zeros(T, n)
  x0[1] = one(T) / 2
  x0[2] = -2 * one(T)
  return ADNLPModels.ADNLPModel(f, x0, name = "freuroth"; kwargs...)
end
