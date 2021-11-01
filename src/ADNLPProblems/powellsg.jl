export powellsg

function powellsg(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  (n % 4 == 0) || @warn("powellsg: number of variables adjusted to be a multiple of 4")
  n = 4 * max(1, div(n, 4))  # number of variables adjusted to be a multiple of 4
  function f(x)
    n = length(x)
    return sum(
      (x[j] + 10 * x[j + 1])^2 +
      5 * (x[j + 2] - x[j + 3])^2 +
      (x[j + 1] - 2 * x[j + 2])^4 +
      10 * (x[j] - x[j + 3])^4 for j = 1:4:n
    )
  end
  x0 = zeros(T, n)
  x0[4 * (collect(1:div(n, 4))) .- 3] .= 3
  x0[4 * (collect(1:div(n, 4))) .- 2] .= -1
  x0[4 * (collect(1:div(n, 4)))] .= 1
  return ADNLPModels.ADNLPModel(f, x0, name = "powellsg_autodiff"; kwargs...)
end
