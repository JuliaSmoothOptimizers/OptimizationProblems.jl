export tquartic

"A quartic function with nontrivial groups and repetitious elements in size 'n' "
function tquartic(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(2, n)
  @adjust_nvar_warn("tquartic", n_orig, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 0.1)

  @objective(nlp, Min, 0.5 * (x[1] - 1.0)^2 + 0.5 * sum((x[1]^2 - x[i + 1]^2)^2 for i = 1:(n - 2)))

  return nlp
end
