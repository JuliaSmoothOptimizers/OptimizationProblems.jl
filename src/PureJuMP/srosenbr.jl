export srosenbr

"The separable extension of Rosenbrock's function 'n' "
function srosenbr(args...; n::Int = default_nvar, kwargs...)
  (n % 2 == 0) || @warn("srosenbr: number of variables adjusted to be even")
  n = 2 * max(1, div(n, 2))

  x0 = ones(n)
  x0[2 * (collect(1:div(n, 2))) .- 1] .= -1.2
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = x0[i])

  @objective(
    nlp,
    Min,
    sum(100.0 * (x[2 * i] - x[2 * i - 1]^2)^2 + (x[2 * i - 1] - 1.0)^2 for i = 1:div(n, 2))
  )

  return nlp
end
