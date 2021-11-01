export sparsine

function sparsine(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 10 || error("sparsine : n ≥ 10")
  function f(x)
    n = length(x)
    return T(0.5) * sum(
      i *
      (
        sin(x[i]) +
        sin(x[mod(2 * i - 1, n) + 1]) +
        sin(x[mod(3 * i - 1, n) + 1]) +
        sin(x[mod(5 * i - 1, n) + 1]) +
        sin(x[mod(7 * i - 1, n) + 1]) +
        sin(x[mod(11 * i - 1, n) + 1])
      )^2 for i = 1:n
    )
  end
  x0 = ones(T, n) / 2
  return ADNLPModels.ADNLPModel(f, x0, name = "sparsine_autodiff"; kwargs...)
end
