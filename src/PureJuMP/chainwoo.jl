export chainwoo

"The chained Woods function in size `n`, a variant on the Woods function"
function chainwoo(args...; n::Int = default_nvar, kwargs...)
  (n % 4 == 0) || @warn("chainwoo: number of variables adjusted to be a multiple of 4")
  n = 4 * max(1, div(n, 4))

  nlp = Model()

  # https://github.com/JuliaOpt/JuMP.jl/issues/481
  # @variable(nlp, x[i=1:n], start=[-3 ; -1 ; -3 ; -1 ; -2 * ones(n-4)])

  @variable(nlp, x[i = 1:n], start = -2)
  set_start_value(x[1], -3)
  set_start_value(x[2], -1)
  set_start_value(x[3], -3)
  set_start_value(x[4], -1)

  @objective(
    nlp,
    Min,
    1.0 + sum(
      100 * (x[2 * i] - x[2 * i - 1]^2)^2 +
      (1 - x[2 * i - 1])^2 +
      90 * (x[2 * i + 2] - x[2 * i + 1]^2)^2 +
      (1 - x[2 * i + 1])^2 +
      10 * (x[2 * i] + x[2 * i + 2] - 2)^2 +
      0.1 * (x[2 * i] - x[2 * i + 2])^2 for i = 1:(div(n, 2) - 1)
    )
  )

  return nlp
end
