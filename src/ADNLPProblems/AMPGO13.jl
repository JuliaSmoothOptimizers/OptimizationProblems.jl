export AMPGO13

function AMPGO13(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    # return 0 < x[1] < 1 ? -(x[1]^(2 // 3) + (1 - x[1]^2)^(1 // 3)) : convert(eltype(x), Inf)
    return (x[1] ≤ 0) * convert(eltype(x), Inf) + (x[1] ≥ 1) * convert(eltype(x), Inf) -
           (abs(x[1])^(2 // 3) + (abs(1 - x[1]^2))^(1 // 3))
  end
  x0 = T[1 / 1000]
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO13"; kwargs...)
end
