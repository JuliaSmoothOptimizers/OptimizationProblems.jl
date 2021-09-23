export AMPGO05 
 
function AMPGO05(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -(T(1.4) - 3 * x[1]) * sin(18 * x[1])
  end
  x0 = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO05"; kwargs...)
end
