export schmvett

function schmvett(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n < 3 && @warn("schmvett: number of variables must be ≥ 3")
  n = max(3, n)
  function f(x; n = length(x))
    return sum(
      -(1 / (1 + (x[i] - x[i + 1])^2)) - sin((π * x[i + 1] + x[i + 2]) / 2) -
      exp(-((x[i] + x[i + 2]) / x[i + 1] - 2)^2) for i = 1:(n - 2)
    )
  end
  x0 = 3 * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "schmvett"; kwargs...)
end
