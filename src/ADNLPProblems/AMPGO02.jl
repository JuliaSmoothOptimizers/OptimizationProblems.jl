export AMPGO02

function AMPGO02(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    return sin(x[1]) + sin(10 // 3 * x[1])
  end
  x0 = T[2.7]
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO02"; kwargs...)
end
