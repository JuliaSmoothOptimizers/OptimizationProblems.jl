export sparsine

function sparsine(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  n = max(10, n)
  @adjust_nvar_warn("sparsine", n_org, n)
  function f(x; n = length(x))
    return 1 // 2 * sum(
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
  return ADNLPModels.ADNLPModel(f, x0, name = "sparsine"; kwargs...)
end
