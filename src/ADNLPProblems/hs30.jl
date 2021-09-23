export hs30 
 
function hs30(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sum(x[i]^2 for i = 1:3)
  end
  x0 = ones(T, 3)
  lvar = T[1, -10, -10]
  uvar = T[10, 10, 10]
  function c(x)
    n = length(x)
    return [x[1]^2 + x[2]^2 - 1]
  end
  lcon = zeros(T, 1)
  ucon = [T(Inf)]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs30"; kwargs...)
end
