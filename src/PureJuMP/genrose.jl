# Generalized Rosenbrock function.
#
#   Source:
#   Y.-W. Shang and Y.-H. Qiu,
#   A note on the extended Rosenbrock function,
#   Evolutionary Computation, 14(1):119–126, 2006.
#
# Shang and Qiu claim the "extended" Rosenbrock function
# previously appeared in
#
#   K. A. de Jong,
#   An analysis of the behavior of a class of genetic
#   adaptive systems,
#   PhD Thesis, University of Michigan, Ann Arbor,
#   Michigan, 1975,
#   (http://hdl.handle.net/2027.42/4507)
#
# but I could not find it there, and in
#
#   D. E. Goldberg,
#   Genetic algorithms in search, optimization and
#   machine learning,
#   Reading, Massachusetts: Addison-Wesley, 1989,
#
# but I don't have access to that book.
#
# This unconstrained problem is analyzed in
#
#   S. Kok and C. Sandrock,
#   Locating and Characterizing the Stationary Points of
#   the Extended Rosenbrock Function,
#   Evolutionary Computation 17, 2009.
#   https://dx.doi.org/10.1162%2Fevco.2009.17.3.437
#
#   classification SUR2-AN-V-0
#
#   problem 36 in
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
# D. Orban, Montreal, 08/2015.

# Note: difference from CUTEst is due to the constant 1.0,
# which does not affect its utility as a test problem other than perhaps
# for convergence-testing.

# Difference with the following is the initial guess.
#
#   Problem 1 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
#

export genrose, rosenbrock

"Generalized Rosenbrock model in size `n`"
function genrose(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("genrose: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  x0 = [(i / (n + 1)) for i = 1:n]
  # Alternative:
  # x0 .= -1.2
  # for i=1:Int(round(n / 2))
  #   x0 = 1
  # end
  @variable(nlp, x[i = 1:n], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    1.0 +
    100 * sum((x[i + 1] - x[i]^2)^2 for i = 1:(n - 1)) +
    sum((x[i] - 1.0)^2 for i = 1:(n - 1))
  )

  return nlp
end

"Classic Rosenbrock problem"
rosenbrock(args...; kwargs...) = genrose(n = 2)
