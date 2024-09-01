# Hock and Schittkowski problem number 87.
#
#   Source:
#   Problem 87 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PLR-AN-5-10

export hs87

"HS87 model"
function hs87(args...; kwargs...)
  nlp = Model()
  x0 = [390, 1000, 419.5, 340.5, 198.175, 0.5]
  lvar = [0, 0, 340, 340, -1000, 0]
  uvar = [400, 1000, 420, 420, 10000, 0.5236]
  @variable(nlp, lvar[i] <= x[i = 1:6] <= uvar[i], start = x0[i])

  a = 131078 // 1000
  b = 148577 // 100000
  ci = 90798 // 100000
  d = cos(147588 // 100000)
  e = sin(147588 // 100000)

  @constraint(nlp, 300 - x[1] - 1 / a * x[3] * x[4] * cos(b - x[6]) + ci / a * d * x[3] == 0)
  @constraint(nlp, -x[2] - 1 / a * x[3] * x[4] * cos(b + x[6]) + ci / a * d * x[4]^2 == 0)
  @constraint(nlp, -x[5] - 1 / a * x[3] * x[4] * cos(b + x[6]) + ci / a * e * x[4]^2 == 0)
  @constraint(nlp, 200 - 1 / a * x[3] * x[4] * sin(b - x[6]) + ci / a * e * x[3]^2 == 0)

  function f1(t)
    return if 0 <= t <= 300
      30 * t
    elseif 300 <= t <= 400
      31 * t
    else
      eltype(x)(Inf)
    end
  end

  function f2(t)
    return if 0 <= t <= 100
      28 * t
    elseif 100 <= t <= 200
      29 * t
    elseif 200 <= t <= 1000
      30 * t
    else
      eltype(t)(Inf)
    end
  end
  @operator(nlp, op_f1, 1, f1)
  @expression(nlp, op_f1)
  @operator(nlp, op_f2, 1, f2)
  @expression(nlp, op_f2)
  @objective(nlp, Min, op_f1(x[1]) + op_f2(x[2]))

  return nlp
end
