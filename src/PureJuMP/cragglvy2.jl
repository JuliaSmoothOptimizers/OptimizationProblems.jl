#  Chained Cragg and Levy function
#
#  This is similar to cragglvy but the quartic term differs.
#
#  Problem 17 in
#  Conn, A.R., Gould, N.I.M, Toint, P.,
#  Testing a Class of Methods for Solving
#  Minimization Problems with Simple Bounds on the Variables, 
#  Mathematics of Computation, 
#  Vol. 50, pp. 399-430, 1988.

#
#   Problem 4 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
#

export cragglvy2

"The extented Cragg and Levy function in size `n`"
function cragglvy2(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("cragglvy: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 2)
  set_start_value(x[1], 1)

  @NLobjective(
    nlp,
    Min,
    sum(
      (exp(x[2 * i - 1]) - x[2 * i])^4 +
      100 * (x[2 * i] - x[2 * i + 1])^6 +
      (tan(x[2 * i + 1] - x[2 * i + 2]))^4 +
      x[2 * i - 1]^8 +
      (x[2 * i + 2] - 1)^2 for i = 1:(div(n, 2) - 1)
    )
  )

  return nlp
end
