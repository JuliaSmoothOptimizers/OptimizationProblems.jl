export hs261

function hs261(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (exp(x[1]) - x[2])^4 + 100 * (x[2] - x[3])^6 + tan(x[3] - x[4])^4 + x[1]^8 + (x[4] - 1)^2
  end
  x0 = T[0, 0, 0, 0]

  return ADNLPModels.ADNLPModel(f, x0, name = "hs261"; kwargs...)
end
