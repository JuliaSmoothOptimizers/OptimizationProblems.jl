export griewank

function griewank(; n::Int = default_nvar, type::Type{T} = Float64, x0::Union{Nothing,AbstractVector} = nothing, kwargs...) where {T}
  function f(x)
    n = length(x)
    sum_term = sum(x[i]^2 for i = 1:n) / T(4000)
    prod_term = prod(cos(x[i] / sqrt(T(i))) for i = 1:n)
    return sum_term - prod_term + one(T)
  end
  if x0 === nothing
    x0 = zeros(T, n)
  else
    length(x0) == n || throw(ArgumentError("griewank: length(x0) = $(length(x0)) must equal n = $n"))
    x0 = T.(x0)
  end
  lvar = fill(T(-600), n)
  uvar = fill(T(600), n)
  return ADNLPModels.ADNLPModel(f, x0; lvar = lvar, uvar = uvar, name = "griewank", kwargs...)
end
