export gaussian

function gaussian(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = 3
    m = 15
    t(i)=(8-i)/2
    y = [0.0009, 0.0044, 0.0175, 0.054, 0.1295, 0.2420, 0.3521, 0.3989, 0.3521, 0.2420, 0.1295, 0.054, 0.0175, 0.0044, 0.0009]

    return sum((x[1]*exp((-x[2]*(t(i)-x[3]^2))/2)-y[i])^2 for i = 1:m)
  end
  x0 = [0.4, 1, 0]
  return ADNLPModels.ADNLPModel(f, x0, name = "gaussian"; kwargs...)
end
