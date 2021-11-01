export fletcbv2

function fletcbv2(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("fletcbv2 : n ≥ 2")
  function f(x)
    n = length(x)
    h = T(1 / (n + 1))
    return T(0.5) * (x[1]^2 + sum((x[i] - x[i + 1])^2 for i = 1:(n - 1)) + x[n]^2) -
           h^2 * sum(2 * x[i] + cos(x[i]) for i = 1:n) - x[n]
  end
  x0 = T.([(i / (n + 1)) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "fletcbv2_autodiff"; kwargs...)
end
