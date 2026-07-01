export sinquad

"Another function with nontrivial groups and repetitious elements in size 'n' "
function sinquad(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(3, n)
  @adjust_nvar_warn("sinquad", n_orig, n)

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
