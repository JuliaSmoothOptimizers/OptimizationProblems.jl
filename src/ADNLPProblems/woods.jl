export woods

function woods(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_orig = n
  n = 4 * max(1, div(n, 4))
  @adjust_nvar_warn("woods", n_orig, n)
  function f(x; n = length(x))
    return sum(
      100 * (x[4 * i - 2] - x[4 * i - 3]^2)^2 +
      (1 - x[4 * i - 3])^2 +
      90 * (x[4 * i] - x[4 * i - 1]^2)^2 +
      (1 - x[4 * i - 1])^2 +
      10 * (x[4 * i - 2] + x[4 * i] - 2)^2 +
      1 // 10 * (x[4 * i - 2] - x[4 * i])^2 for i = 1:div(n, 4)
    )
  end

  x0 = -3 * ones(T, n)
  x0[2 * (collect(1:div(n, 2)))] .= -one(T)

  return ADNLPModels.ADNLPModel(f, x0, name = "woods"; kwargs...)
end
