export hs65

function hs65(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - x[2])^2 + ((x[1] + x[2] - 10)^2) / 9 + (x[3] - 5)^2
  end
  x0 = T[-5, 5, 0]
  lvar = T[-4.5, -4.5, -5]
  uvar = T[4.5, 4.5, 5]
  function c(x)
    n = length(x)
    return [x[1]^2 + x[2]^2 + x[3]^2]
  end
  lcon = T[-Inf]
  ucon = T[48]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs65"; kwargs...)
end
