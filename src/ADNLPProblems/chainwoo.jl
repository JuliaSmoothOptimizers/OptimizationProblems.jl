export chainwoo

function chainwoo(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  (n % 4 == 0) || @warn("chainwoo: number of variables adjusted to be a multiple of 4")
  n = 4 * max(1, div(n, 4))
  function f(x)
    n = length(x)
    return 1 + sum(
      100 * (x[2 * i] - x[2 * i - 1]^2)^2 +
      (1 - x[2 * i - 1])^2 +
      90 * (x[2 * i + 2] - x[2 * i + 1]^2)^2 +
      (1 - x[2 * i + 1])^2 +
      10 * (x[2 * i] + x[2 * i + 2] - 2)^2 +
      1 // 10 * (x[2 * i] - x[2 * i + 2])^2 for i = 1:(div(n, 2) - 1)
    )
  end
  x0 = vcat([-3, -1, -3, -1], -2 * ones(T, n - 4))
  return ADNLPModels.ADNLPModel(f, x0, name = "chainwoo"; kwargs...)
end
