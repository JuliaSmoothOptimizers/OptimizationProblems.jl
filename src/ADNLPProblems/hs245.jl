export hs245

function hs245(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return sum(
      (
        exp(-x[1] * i / 10) - exp(-x[2] * i / 10) -
        x[3] * (exp(-one(eltype(x)) * i / 10) - exp(-one(eltype(x)) * i))
      )^2 for i = 1:10
    )
  end
  x0 = T[0, 10, 20]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs245"; kwargs...)
end
