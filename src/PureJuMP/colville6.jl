export colville6

"Hock and Schittkowski problem 87 with Colville's constants b = f = 1.48477"
function colville6(args...; kwargs...)
  nlp = Model()
  x0 = [390, 1000, 419.5, 340.5, 198.175, 0.5]
  lvar = [0, 0, 340, 340, -1000, 0]
  uvar = [400, 1000, 420, 420, 10000, 0.5236]
  @variable(nlp, lvar[i] <= x[i = 1:6] <= uvar[i], start = x0[i])

  a = 131.078
  b = 1.48477
  c = 0.90798
  d = cos(1.47588)
  e = sin(1.47588)

  @constraint(nlp, 300 - x[1] - x[3] * x[4] * cos(b - x[6]) / a + c * d * x[3]^2 / a == 0)
  @constraint(nlp, -x[2] - x[3] * x[4] * cos(b + x[6]) / a + c * d * x[4]^2 / a == 0)
  @constraint(nlp, -x[5] - x[3] * x[4] * sin(b + x[6]) / a + c * e * x[4]^2 / a == 0)
  @constraint(nlp, 200 - x[3] * x[4] * sin(b - x[6]) / a + c * e * x[3]^2 / a == 0)

  f1(t) = t < 300 ? 30 * t : 31 * t
  f2(t) = t < 100 ? 28 * t : (t < 200 ? 29 * t : 30 * t)
  @operator(nlp, op_f1, 1, f1)
  @operator(nlp, op_f2, 1, f2)
  @objective(nlp, Min, op_f1(x[1]) + op_f2(x[2]))

  return nlp
end
