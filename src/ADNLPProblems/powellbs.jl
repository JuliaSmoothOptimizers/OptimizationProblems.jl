export powellbs

function powellbs(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  f(x) = 1 // 2 * ((10000 * x[1] * x[2] - 1)^2 + (exp(-x[1]) + exp(-x[2]) - 10001 // 10000)^2)
  x0 = T[0, 1]
  return ADNLPModels.ADNLPModel(f, x0, name = "powellbs"; kwargs...)
end
