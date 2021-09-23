export AMPGO14 
 
function AMPGO14(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -exp(-x[1]) * sin(2 * (pi * x[1]))
  end
  x0 = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO14"; kwargs...)
end
