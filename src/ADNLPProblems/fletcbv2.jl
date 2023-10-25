export fletcbv2

function fletcbv2(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n < 2 && @warn("fletchbv2: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x; n = length(x))
    h = 1 // (n + 1)
    return 1 // 2 * (x[1]^2 + sum((x[i] - x[i + 1])^2 for i = 1:(n - 1)) + x[n]^2) -
           h^2 * sum(2 * x[i] + cos(x[i]) for i = 1:n) - x[n]
  end
  x0 = T.([(i / (n + 1)) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "fletcbv2"; kwargs...)
end
