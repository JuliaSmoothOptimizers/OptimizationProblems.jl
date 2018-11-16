#   Extended Cragg and Levy problem.
#   The Hessian matrix is 7-diagonal.
#
#   Source: problem 32 in
#   Ph. L. Toint,
#   Test problems for partially separable optimization and results
#   for the routine PSPMIN,
#   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.
#
# See also
#
#   problem 7 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   classification OUR2-AY-V-0
#
# D. Orban, Montreal, 08/2015.

export cragglvy

"The extented Cragg and Levy function in size `n`"
function cragglvy(n :: Int=100)

  n < 2 && Compat.@warn("cragglvy: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  # https://github.com/JuliaOpt/JuMP.jl/issues/481
  # @variable(nlp, x[i=1:n], start=[1 ; 2 * ones(n-1)])

  @variable(nlp, x[i=1:n], start=2)
  setvalue(x[1], 1)

  @NLobjective(
    nlp,
    Min,
    sum((exp(x[2*i-1]) - x[2*i])^4 + 100 * (x[2*i] - x[2*i+1])^6 +
        (tan(x[2*i+1] - x[2*i+2]) + x[2*i+1] - x[2*i+2])^4 +
        x[2*i-1]^8 + (x[2*i+2] - 1)^2 for i = 1:div(n,2)-1)
  )

  return nlp
end
