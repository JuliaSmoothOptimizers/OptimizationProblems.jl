export gaussian

function gaussian(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    y = T[.0009, .0044, .0175, .054, .1295, .242, .3521, .3989, .3521, .242, .1295, .054, .0175, .0044, .0009]
    return sum( (x[1]*exp(-x[2]/2*(T(8-i)/2-x[3])^2)-y[i])^2 for i=1:15)
  end
  x0 = T[.4, 1, 0]
  return ADNLPModels.ADNLPModel(f, x0, name = "gaussian"; kwargs...)
end
