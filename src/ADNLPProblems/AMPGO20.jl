export AMPGO20 
 
function AMPGO20(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -(x[1] - sin(x[1])) * exp(-x[1]^2)
  end
  x0 = T[-10]
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO20"; kwargs...)
end
