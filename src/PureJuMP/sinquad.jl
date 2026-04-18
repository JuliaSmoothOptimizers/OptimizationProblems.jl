export sinquad

"Another function with nontrivial groups and repetitious elements in size 'n' "
function sinquad(args...; n::Int = default_nvar, kwargs...)
  n < 3 && @warn("sinquad: number of variables must be ≥ 3")
  n = max(3, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 0.1)

  @objective(
    nlp,
    Min,
    (x[1] - 1.0)^4 +
    (x[n]^2 - x[1]^2)^2 +
    sum((sin(x[i] - x[n]) - x[1]^2 + x[i]^2)^2 for i = 2:(n - 1))
  )

  return nlp
end
