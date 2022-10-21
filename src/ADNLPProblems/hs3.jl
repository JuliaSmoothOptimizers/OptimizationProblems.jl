export hs3

function hs3(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return x[2] + 1 // 100000 * (x[2] - x[1])^2
  end
  x0 = T[10, 1]
  lvar = T[-Inf, 0]
  uvar = T[Inf, Inf]
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, name = "hs3"; kwargs...)
end
