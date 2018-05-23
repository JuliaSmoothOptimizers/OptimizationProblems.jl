# Hock and Schittkowski problem number 99.
#
#   Source:
#   Problem 99 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#   
#   classification GGR-AN-7-2
#
# A. Montoison, Montreal, 05/2018.

export hs99

"HS99 model"
function hs99(args...)
  nlp = Model()

  x0 = [0.5,0.5,0.5,0.5,0.5,0.5,0.5]
  @variable(nlp, x[i=1:7], start=x0[i])

  b = 32
  a = [0,50,50,75,75,75,100,100]
  t = [0,25,50,100,150,200,290,380]

  function fr(x1,x2,x3,x4,x5,x6,x7)
    r = Array{Float64}(8)
    r[1] = 0
    for i=2:8
      r[i] = a[i]*(t[i] - t[i-1])*cos(x[i-1]) + r[i-1]
    end
    return r
  end

  JuMP.register(nlp, :fr, 7, fr, autodiff=true)
  @NLexpression(nlp, r[i=1:8], fr(x[1],x[2],x[3],x[4],x[5],x[6],x[7]))

  function fs(x1,x2,x3,x4,x5,x6,x7)
    s = Array{Float64}(8)
    s[1] = 0
    for i=2:8
      s[i] = (t[i] - t[i-1])*(a[i]*sin(x[i-1]) - b) + s[i-1]
    end
    return s
  end

  JuMP.register(nlp, :fs, 7, fs, autodiff=true)
  @NLexpression(nlp, s[i=1:8], fs(x[1],x[2],x[3],x[4],x[5],x[6],x[7]))

  function fq(x1,x2,x3,x4,x5,x6,x7)
    q = Array{Float64}(8)
    q[1] = 0
    for i=2:8
      q[i] = 0.5*(t[i] - t[i-1])^2*(a[i]*sin(x[i-1]) - b) + (t[i] - t[i-1])*s[i-1] + q[i-1]
    end
    return q
  end

  JuMP.register(nlp, :fq, 7, fq, autodiff=true)
  @NLexpression(nlp, q[i=1:8], fq(x[1],x[2],x[3],x[4],x[5],x[6],x[7]))

  @NLconstraint(nlp, q[8] - 1e5 == 0)
  @NLconstraint(nlp, s[8] - 1e3 == 0)

  for i=1:7
    @constraint(nlp, 0 <= x[i] <= 1.58)
  end    

  @NLobjective(
    nlp,
    Min,
    -r[8]^2
    )

  return nlp
end