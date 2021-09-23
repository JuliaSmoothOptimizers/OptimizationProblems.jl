export AMPGO15 
 
function AMPGO15(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1]^2 - 5 * x[1] + 6) / (x[1]^2 + 1)
  end
  x0 = T[-5]
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO15"; kwargs...)
end
