#   The Power problem by Oren.
#
#   Source:
#   S.S. Oren,
#   Self-scaling variable metric algorithms,
#   Part II: implementation and experiments"
#   Management Science 20(5):863-874, 1974.
#   See also Buckley#179 (p. 83)
#
#   classification OUR2-AN-V-0

export power

"The Power problem by Oren."
function power(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 1.0)

  @objective(nlp, Min, 0.5 * (sum((i * x[i]^2) for i = 1:n))^2)

  return nlp
end
