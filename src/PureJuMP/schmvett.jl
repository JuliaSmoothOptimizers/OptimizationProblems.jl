export schmvett

"Another function with nontrivial groups and repetitious elements in size 'n' "
function schmvett(args...; n::Int = default_nvar, kwargs...)
  n < 3 && @warn("schmvett: number of variables must be ≥ 3")
  n = max(3, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 3.0)

  @objective(
    nlp,
    Min,
    sum(
      -(1.0 / (1.0 + (x[i] - x[i + 1])^2)) - sin((pi * x[i + 1] + x[i + 2]) / 2.0) -
      exp(-((x[i] + x[i + 2]) / x[i + 1] - 2.0)^2) for i = 1:(n - 2)
    )
  )

  return nlp
end
