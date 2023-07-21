export hs242

function hs242(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  t = [ (10 + i) // 100 for i=1:10]
  function f(x::AbstractVector{Ti}; t = Ti.(t)) where {Ti}
    return  sum( ((exp(-x[1] * t[i]) - exp(-x[2] * t[i])) - x[3] * (exp(-t[i]) - exp(-10 * t[i])))^2 for i=1:10)
  end
  x0 = T[2.5, 10, 10]
  lvar = T[0, 0, 0]
  uvar = T[10, 10, 10]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "hs242"; kwargs...)
end
