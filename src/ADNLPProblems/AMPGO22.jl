export AMPGO22 
 
function AMPGO22(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return exp(-3 * x[1]) - sin(x[1])^3
  end
  x0 = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO22"; kwargs...)
end
