export noncvxu2

function noncvxu2(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  n = max(2, n)
  @adjust_nvar_warn("noncvxu2", n_org, n)
  function f(x; n = length(x))
    return sum(
      (x[i] + x[mod(3 * i - 2, n) + 1] + x[mod(7 * i - 3, n) + 1])^2 +
      4 * cos(x[i] + x[mod(3 * i - 2, n) + 1] + x[mod(7 * i - 3, n) + 1]) for i = 1:n
    )
  end
  x0 = T.([i for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "noncvxu2"; kwargs...)
end
