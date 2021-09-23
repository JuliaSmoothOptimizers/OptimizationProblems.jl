export AMPGO21 
 
function AMPGO21(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] * sin(x[1])) + (x[1] * cos(2 * x[1]))
  end
  x0 = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO21"; kwargs...)
end
