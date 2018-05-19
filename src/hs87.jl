# Hock and Schittkowski problem number 87.
#
#   Source:
#   Problem 87 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GGI-AN-6-4
#
# A. Montoison, Montreal, 05/2018.

export hs87

"HS87 model"
function hs87(args...)
  nlp = Model()

  x0 = [390,1000,419.5,340.5,198.175,0.5]
  @variable(nlp, x[i=1:6], start=x0[i])

  a = 131.078
  b = 1.48577
  c = 0.90798
  d = cos(1.47588)
  e = sin(1.47588)

  @NLconstraint(nlp, 30  - x[1] - 1/a*x[3]*x[4]*cos(b-x[6]) + c/a*d*x[3]^2 == 0)
  @NLconstraint(nlp,     - x[2] - 1/a*x[3]*x[4]*cos(b+x[6]) + c/a*d*x[4]^2 == 0)
  @NLconstraint(nlp,     - x[5] - 1/a*x[3]*x[4]*cos(b+x[6]) + c/a*e*x[4]^2 == 0)
  @NLconstraint(nlp, 200        - 1/a*x[3]*x[4]*cos(b-x[6]) + c/a*e*x[3]^2 == 0)

  @constraint(nlp, 0     <= x[1] <= 400)
  @constraint(nlp, 0     <= x[2] <= 1000)
  @constraint(nlp, 340   <= x[3] <= 420)
  @constraint(nlp, 340   <= x[4] <= 420)
  @constraint(nlp, -1000 <= x[5] <= 10000)
  @constraint(nlp, 0     <= x[6] <= 0.5236)

  function f1(x1)
    if x1 < 300
      res = 30*x1
    else
      res = 31*x1
    end
    return res
  end

  function f2(x2)
    if x2 < 100
      res = 28*x2
    elseif (x2 >= 100 && x2 < 200)
      res = 29*x2
    else
      res = 30*x2
    end
    return res
  end

  JuMP.register(nlp, :f1, 1, f1, autodiff=true)
  JuMP.register(nlp, :f2, 1, f2, autodiff=true)

  @NLobjective(
    nlp,
    Min,
    f1(x[1]) + f2(x[2])
    )

  return nlp
end