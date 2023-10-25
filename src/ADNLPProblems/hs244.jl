export hs244

function hs244(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return sum(
      (
        exp(-x[1] * (10 + i) / 100) - x[3] * exp(-x[2] * (10 + i) / 100) -
        (exp(-one(eltype(x)) * (10 + i) / 100) - 5 * exp(-one(eltype(x)) * (10 + i) / 10))
      )^2 for i = 1:10
    )
  end
  x0 = T[1, 2, 1]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs244"; kwargs...)
end
