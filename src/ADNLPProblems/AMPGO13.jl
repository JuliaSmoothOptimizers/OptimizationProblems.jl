export AMPGO13

function AMPGO13(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 0.0 < x[1] < 1.0 ? -T(x[1]^0.666666 + (1 - x[1]^2)^0.333333) : Inf
  end
  x0 = T[0.001]
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO13"; kwargs...)
end
