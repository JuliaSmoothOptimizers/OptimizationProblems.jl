export brybnd

function brybnd(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    ml = 5
    mu = 1
    return sum(
      (
        x[i] * (2 + 5 * x[i]^2) + 1 -
        sum(x[j] * (1 + x[j]) for j = max(1, i - ml):min(n, i + mu) if j != i)
      )^2 for i = 1:n
    )
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "brybnd_autodiff"; kwargs...)
end
