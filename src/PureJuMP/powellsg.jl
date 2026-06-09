export powellsg

"The extended Powell singular problem in size 'n' "
function powellsg(args...; n::Int = default_nvar, kwargs...)
  n_org = n
  n = 4 * max(1, div(n, 4))
  @adjust_nvar_warn("powellsg", n_org, n)

  x0 = zeros(n)
  x0[4 * (collect(1:div(n, 4))) .- 3] .= 3.0
  x0[4 * (collect(1:div(n, 4))) .- 2] .= -1.0
  x0[4 * (collect(1:div(n, 4)))] .= 1.0

  nlp = Model()
  @variable(nlp, x[i = 1:n], start = x0[i])

  @objective(
    nlp,
    Min,
    sum(
      (x[j] + 10.0 * x[j + 1])^2 +
      5.0 * (x[j + 2] - x[j + 3])^2 +
      (x[j + 1] - 2.0 * x[j + 2])^4 +
      10.0 * (x[j] - x[j + 3])^4 for j = 1:4:n
    )
  )

  return nlp
end
