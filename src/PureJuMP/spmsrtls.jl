#   Liu and Nocedal tridiagonal matrix square root problem.

#   Source:  problem 151 (p. 93) in
#   A.R. Buckley,
#   "Test functions for unconstrained minimization",
#   TR 1989CS-3, Mathematics, statistics and computing centre,
#   Dalhousie University, Halifax (CDN), 1989.

#   See also
#
#   problem 54 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf

#   classification SUR2-AN-V-V
export spmsrtls

function spmsrtls(args...; n::Int = default_nvar, kwargs...)
  m = max(Int(round((n + 2) / 3)), 34)
  n = m * 3 - 2
  p = [sin(i^2) for i=1:n]
  x0 = [p[i]/5 for i=1:n]

  nlp = Model()
  @variable(nlp, x[i=1:n], start=x0[i])
  @NLobjective(
    nlp,
    Min,
    sum((x[(3 * (i - 1) + 1)-4] * x[(3 * (i - 1) + 1) - 1] - p[(3 * (i - 1) + 1)-4]*p[(3 * (i - 1) + 1)-1])^2 for i = 3:m) +
    sum((x[(3 * (i - 1) + 1)-3] * x[(3 * (i - 1) + 1)-1] + x[(3 * (i - 1) + 1)-1]*x[(3 * (i - 1) + 1)] - p[(3 * (i - 1) + 1)-3]*p[(3 * (i - 1) + 1)-1] - p[(3 * (i - 1) + 1)-1]*p[(3 * (i - 1) + 1)])^2 for i = 2:m) +
    sum((x[(3 * (i - 1) + 1)]^2 - p[(3 * (i - 1) + 1)]^2)^2 for i = 1:m) +
    sum((x[(3 * (i - 1) + 1)-2]*x[(3 * (i - 1) + 1)-1] - p[(3 * (i - 1) + 1)-2] * p[(3 * (i - 1) + 1)-1])^2 for i = 2:m) +
    sum((x[(3 * (i - 1) + 1)+2]*x[(3 * (i - 1) + 1)+1] - p[(3 * (i - 1) + 1)+2] * p[(3 * (i - 1) + 1)+1])^2 for i = 1:(m-1)) +
    sum((x[(3 * (i - 1) + 1)+3] * x[(3 * (i - 1) + 1)+1] + x[(3 * (i - 1) + 1)+1]*x[(3 * (i - 1) + 1)] - p[(3 * (i - 1) + 1)+3]*p[(3 * (i - 1) + 1)+1] - p[(3 * (i - 1) + 1)+1]*p[(3 * (i - 1) + 1)])^2 for i = 1:(m-1)) +
    sum((x[(3 * (i - 1) + 1)+4] * x[(3 * (i - 1) + 1) + 1] - p[(3 * (i - 1) + 1)+4]*p[(3 * (i - 1) + 1)+1])^2 for i = 1:(m-2))
  )
  return nlp
end
