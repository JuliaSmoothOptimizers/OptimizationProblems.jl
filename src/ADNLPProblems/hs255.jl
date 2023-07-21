export hs255

function hs255(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    return 100 * (x[2] - x[1]^2) +
           (1 - x[1])^2 +
           90 * (x[4] - x[3]^2) +
           (1 - x[3])^2 +
           101 // 10 * (x[2] - 1)^2 +
           101 // 10 * (x[4] - 1)^2 +
           198 // 10 * (x[2] - 1) * (x[4] - 1)
  end
  x0 = T[-3, 1, -3, 1]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs255"; kwargs...)
end
