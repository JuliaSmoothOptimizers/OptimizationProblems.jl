export zangwil3

function zangwil3(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return zero(T)
  end
  x0 = T[100, -1, 2.5]
  function c(x)
    n = length(x)
    return [x[1] - x[2] + x[3], -x[1] + x[2] + x[3], x[1] + x[2] - x[3]]
  end
  lcon = zeros(T, 3)
  ucon = zeros(T, 3)
  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "zangwil3", lin = [1, 2, 3]; kwargs...)
end
