export BOX3

function BOX3(
  args...;
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  m::Int = 2n,
  kwargs...,
) where {T}
  m < 3 && @warn("BOX3: must have m ≥ 3")
  m = max(m, 3)

  x0 = T[0; 10; 20]
  f(x) =
    one(T) / 2 * sum(
      (
        exp(-one(T) / 10 * j * x[1]) - exp(-one(T) / 10 * j * x[2]) -
        x[3] * (exp(-one(T) / 10 * j) - exp(-T(j)))
      )^2 for j = 1:m
    )

  return ADNLPModels.ADNLPModel(f, x0, name = "BOX3"; kwargs...)
end
