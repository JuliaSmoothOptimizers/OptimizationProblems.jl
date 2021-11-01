export fletcbv3_mod

function fletcbv3_mod(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("fletcbv3 : n ≥ 2")
  function f(x)
    n = length(x)
    p = T(10.0^(-8))
    h = T(1 / (n + 1))
    return (p / 2) * (x[1]^2 + sum((x[i] - x[i + 1])^2 for i = 1:(n - 1)) + x[n]^2) -
           p * sum(100 * (1 + (2 / h^2)) * sin(x[i] / 100) + (1 / h^2) * cos(x[i]) for i = 1:n)
  end
  x0 = T.([(i / (n + 1)) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "fletcbv3_autodiff"; kwargs...)
end
