#   Source:  problem 8 in
#   A. R. Conn, N. I. M. Gould and Ph. L. Toint,
#   Testing a class of methods for solving minimization
#   problems with simple bounds on their variables,
#   Mathematics of Computation 50, p 399-430, 1988.
#
# See also
#
#   problem 5 in
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

export chainwoo, woods

"The chained Woods function in size `n`, a variant on the Woods function"
function chainwoo(n :: Int=100)

  (n % 4 == 0) || @warn("chainwoo: number of variables adjusted to be a multiple of 4")
  n = 4 * max(1, div(n, 4))

  nlp = Model()

  # https://github.com/JuliaOpt/JuMP.jl/issues/481
  # @variable(nlp, x[i=1:n], start=[-3 ; -1 ; -3 ; -1 ; -2 * ones(n-4)])

  @variable(nlp, x[i=1:n], start=-2)
  set_start_value(x[1], -3)
  set_start_value(x[2], -1)
  set_start_value(x[3], -3)
  set_start_value(x[4], -1)

  @NLobjective(
    nlp,
    Min,
    1.0 + sum(100 * (x[2*i]   - x[2*i-1]^2)^2 + (1 - x[2*i-1])^2 +
               90 * (x[2*i+2] - x[2*i+1]^2)^2 + (1 - x[2*i+1])^2 +
               10 * (x[2*i] + x[2*i+2] - 2)^2 + 0.1 * (x[2*i] - x[2*i+2])^2 for i=1:div(n,2)-1)
  )

  return nlp
end


"The Woods function."
woods(args...) = chainwoo(4)
