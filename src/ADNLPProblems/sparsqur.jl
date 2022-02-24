export sparsqur

function sparsqur(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 10 && @warn("sparsqur: number of variables must be ≥ 10")
  n = max(10, n)
  function f(x)
    n = length(x)
    return T(1 / 8) * sum(
      i *
      (
        x[i]^2 +
        x[mod(2 * i - 1, n) + 1]^2 +
        x[mod(3 * i - 1, n) + 1]^2 +
        x[mod(5 * i - 1, n) + 1]^2 +
        x[mod(7 * i - 1, n) + 1]^2 +
        x[mod(11 * i - 1, n) + 1]^2
      )^2 for i = 1:n
    )
  end
  x0 = ones(T, n) / 2
  return ADNLPModels.ADNLPModel(f, x0, name = "sparsqur"; kwargs...)
end
