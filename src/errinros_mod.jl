# Errin Rosenbrock - modified function.

#   problem 27 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   classification SUR2-AN-V-0
#
# J,-P, Dussault, Rennes 09/2015.

export errinros_mod

function errinros_mod(n :: Int=100)

  n < 2 && Compat.@warn("errinros_mod: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=-1.0)

  @NLobjective(
    nlp,
    Min,
    sum((x[i-1] - 16.0 * x[i]^2 * (1.5 + sin(i))^2)^2 for i=2:n) + sum((1.0 - x[i])^2 for i=2:n)
  )

  return nlp
end
