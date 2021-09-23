export Dus2_1 
 
function Dus2_1(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return exp(x[1] * (x[1] - 1))
  end
  x0 = T[-1]
  return ADNLPModels.ADNLPModel(f, x0, name = "Dus2_1"; kwargs...)
end
