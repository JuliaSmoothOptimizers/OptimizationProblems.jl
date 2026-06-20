export griewank

function griewank(; n::Int = default_nvar, type::Type{T} = Float64, x0::Union{Nothing,AbstractVector{T}}=nothing, kwargs...) where {T}
  function f(x)
    n = length(x)
    sum_term = sum(x[i]^2 for i = 1:n) / 4000
    prod_term = prod(cos(x[i] / sqrt(T(i))) for i = 1:n)
    return sum_term - prod_term + 1
  end
  if x0 === nothing
    x0 = zeros(T, n)
  end
  return ADNLPModels.ADNLPModel(f, x0, name = "griewank"; kwargs...)
end
