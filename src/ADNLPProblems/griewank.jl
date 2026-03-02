export griewank

function griewank(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    sum_term = sum(x[i]^2 for i = 1:n) / 4000
    prod_term = prod(cos(x[i] / sqrt(T(i))) for i = 1:n)
    return sum_term - prod_term + 1
  end
  x0 = T[-600 + 1200 * rand(T) for _ = 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "griewank"; kwargs...)
end
