# Hanging Chain

# Find the chain (of uniform density) of length L suspended between two points with minimal
# potential energy.

#   This is problem 4 in the COPS (Version 3) collection of 
#   E. Dolan and J. More'
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#   classification OOR2-AN-V-V

export chain

function chain(args...; n::Int = default_nvar, kwargs...)
  nh = max(2, div(n - 4, 4))

  L = 4
  a = 1
  b = 3
  tmin = b > a ? 1 / 4 : 3 / 4
  tf = 1.0
  h = tf / nh

  nlp = Model()

  @variable(nlp, u[k = 1:(nh + 1)], start = 4 * abs(b - a) * ( k / nh - tmin ))
  @variable(nlp, x1[k = 1:(nh + 1)], start = 4 * abs(b - a) * k / nh * (1 / 2 * k / nh - tmin) + a)
  @variable(nlp, x2[k = 1:(nh + 1)], start = (4 * abs(b - a) * k / nh * (1 / 2 * k / nh - tmin) + a) * (4 * abs(b - a) * ( k / nh - tmin )))
  @variable(nlp, x3[k = 1:(nh + 1)], start = 4 * abs(b - a) * ( k / nh - tmin ))

  @NLobjective(nlp, Min, x2[nh + 1])

  for j = 1:nh
    @constraint(nlp, x1[j + 1] - x1[j] - 1 / 2 * h * (u[j] + u[j + 1]) == 0)
  end
  @constraint(nlp, x1[1] == a)
  @constraint(nlp, x1[nh + 1] == b)
  @constraint(nlp, x2[1] == 0)
  @constraint(nlp, x3[1] == 0)
  @constraint(nlp, x3[nh + 1] == L)

  @NLconstraint(nlp, [j = 1:nh], x2[j + 1] - x2[j] - 1 / 2 * h * (x1[j] * sqrt(1 + u[j]^2) + x1[j + 1] * sqrt(1 + u[j + 1]^2)) == 0)
  @NLconstraint(nlp, [j = 1:nh], x3[j + 1] - x3[j] - 1 / 2 * h * (sqrt(1 + u[j]^2) + sqrt(1 + u[j + 1]^2)) == 0)

  return nlp
end
