export hs4 
 
function hs4(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] + 1)^3 / 3 + x[2]
  end
  x0 = T[1.125, 0.125]
  lvar = T[1, 0]
  uvar = T[Inf, Inf]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "hs4"; kwargs...)
end
