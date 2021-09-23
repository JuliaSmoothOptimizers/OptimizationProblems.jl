export AMPGO06 
 
function AMPGO06(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -(x[1] + sin(x[1])) * exp(-x[1]^2)
  end
  x0 = T[-10]
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO06"; kwargs...)
end
