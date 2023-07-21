export hs260

function hs260(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2 + 90 * (x[4] - x[3]^2)^2 + (1 - x[3])^2 + 99 // 10 * ((x[2] - 1) + (x[4] - 1))^2 + 2 // 10 * ((x[2] - 1)^2 + (x[4] - 1)^2)
  end
  x0 = T[-3, -1, -3, -1]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs260"; kwargs...)
end
