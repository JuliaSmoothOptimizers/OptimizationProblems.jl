export hs19

function hs19(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - 10)^3 + (x[2] - 20)^3
  end
  x0 = T[20.1, 5.84]
  lvar = T[13, 0]
  uvar = T[100, 100]
  function c(x)
    n = length(x)
    return [(x[1] - 5)^2 + (x[2] - 5)^2 - 100, (x[2] - 5)^2 + (x[1] - 6)^2 - T(82.81)]
  end
  lcon = [zero(T), -T(Inf)]
  ucon = [T(Inf), zero(T)]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs19"; kwargs...)
end
