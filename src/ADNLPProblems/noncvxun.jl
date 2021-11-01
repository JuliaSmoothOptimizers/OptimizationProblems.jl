export noncvxun

function noncvxun(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("noncvxun : n ≥ 2")
  function f(x)
    n = length(x)
    return sum(
      (x[i] + x[mod(2 * i - 1, n) + 1] + x[mod(3 * i - 1, n) + 1])^2 +
      4 * cos(x[i] + x[mod(2 * i - 1, n) + 1] + x[mod(3 * i - 1, n) + 1]) for i = 1:n
    )
  end
  x0 = T.([i for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "noncvxun_autodiff"; kwargs...)
end
