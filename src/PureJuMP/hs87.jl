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
#
# A. Montoison, Montreal, 05/2018.

export hs87

"HS87 model"
function hs87(args...; kwargs...)
  nlp = Model()
  x0 = [390, 1000, 419.5, 340.5, 198.175, 0.5]
  lvar = [0, 0, 340, 340, -1000, 0]
  uvar = [400, 1000, 420, 420, 10000, .5236]
  @variable(nlp, lvar[i] <= x[i = 1:6] <= uvar[i], start = x0[i])

  a = 131078 // 1000
  b = 148577 // 100000
  ci = 90798 // 100000
  d = cos(147588 // 100000)
  e = sin(147588 // 100000)


  @NLconstraint(nlp, 300 - x[1] - 1 / a * x[3] * x[4] * cos(b - x[6]) + ci / a * d * x[3] == 0)
  @NLconstraint(nlp, -x[2] - 1 / a * x[3] * x[4] * cos(b + x[6]) + ci / a * d * x[4]^2 == 0)
  @NLconstraint(nlp, -x[5] - 1 / a * x[3] * x[4] * cos(b + x[6]) + ci / a * e * x[4]^2 == 0)
  @NLconstraint(nlp, 200 - 1 / a * x[3] * x[4] * sin(b - x[6]) + ci / a * e * x[3]^2 == 0)

  function f1(x)
    return if 0 <= x <= 300
      30 * x
    elseif 300 <= x <= 400
      31 * x
    else
      eltype(x)(Inf)
    end
  end

  function f2(x)
    return if 0 <= x <= 100
      28 * x
    elseif 100 <= x <= 200
      29 * x
    elseif 200 <= x <= 1000
      30 * x
    else
      eltype(x)(Inf)
    end
  end 
  register(nlp, :f1, 1 , f1, autodiff = true)
  register(nlp, :f2, 1 , f2, autodiff = true)
  @NLobjective(
    nlp,
    Min,
    f1(x[1]) + f2(x[2])
  )

  return nlp
end
