export fletcbv3_mod

function fletcbv3_mod(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 2 && @warn("fletchbv3_mod: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x)
    n = length(x)
    p = 1 // 100000000
    h = 1 // (n + 1)
    return (p / 2) * (x[1]^2 + sum((x[i] - x[i + 1])^2 for i = 1:(n - 1)) + x[n]^2) -
           p * sum(100 * (1 + (2 / h^2)) * sin(x[i] / 100) + (1 / h^2) * cos(x[i]) for i = 1:n)
  end
  x0 = T.([(i / (n + 1)) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "fletcbv3"; kwargs...)
end
