# Hock and Schittkowski problem number 57.
#
#   Source:
#   Problem 57 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification SQR-AN-2-1
#
# A. Montoison, Montreal, 05/2018.

export hs57

"HS57 model"
function hs57(args...)
  
  nlp  = Model()
  x0   = [0.42,  5]
  lvar = [0.4,  -4]
  @variable(nlp, x[i=1:2] >= lvar[i], start = x0[i])
  
  a = Array{Int64}(undef,44)
  a[1:2]   .= 8
  a[3:6]   .= 10
  a[7:10]  .= 12
  a[11:13] .= 14
  a[14:16] .= 16
  a[17:18] .= 18
  a[19:21] .= 20
  a[22:24] .= 22
  a[25:27] .= 24
  a[28:30] .= 26
  a[31:32] .= 28
  a[33:35] .= 30
  a[36:37] .= 32
  a[38]    = 34
  a[39:40] .= 36
  a[41:42] .= 38
  a[43]    = 40
  a[44]    = 42

  b = Array{Float64}(undef,44)
  b[1:2]   .= 0.49
  b[3]     = 0.48
  b[4]     = 0.47
  b[5]     = 0.48
  b[6]     = 0.47
  b[7:8]   .= 0.46
  b[9]     = 0.45
  b[10]    = 0.43
  b[11]    = 0.45
  b[12:13] .= 0.43
  b[14]    = 0.44
  b[15:16] .= 0.43
  b[17]    = 0.46
  b[18]    = 0.45
  b[19:20] .= 0.42
  b[21]    = 0.43
  b[22:23] .= 0.41
  b[24]    = 0.40
  b[25]    = 0.42
  b[26:27] .= 0.40
  b[28]    = 0.41
  b[29]    = 0.40
  b[30:31] .= 0.41
  b[32:34] .= 0.40
  b[35]    = 0.38
  b[36]    = 0.41
  b[37:38] .= 0.40
  b[39]    = 0.41
  b[40]    = 0.38
  b[41:42] .= 0.40
  b[43:44] .= 0.39

  @NLconstraint(nlp, 0.49*x[2] - x[1]*x[2] - 0.09 >= 0)

  @NLexpression(nlp, f[i=1:44], b[i] - x[1] - (0.49 - x[1])*exp(-x[2]*(a[i] - 8))
  )  

  @NLobjective(
    nlp,
    Min,
    sum(f[i]^2 for i=1:44)
  )

  return nlp
end
