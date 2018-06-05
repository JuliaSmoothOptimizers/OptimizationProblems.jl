# Hock and Schittkowski problem number 72.
#
#   Source:
#   Problem 72 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification LPR2-AN-4-2
#
# A. Montoison, Montreal, 05/2018.

export hs72

"HS72 model"
function hs72(args...)
  
  nlp  = Model()
  uvar = [(5-i)*1e5 for i=1:4]
  @variable(nlp, 0.001 <= x[i=1:4] <= uvar[i], start = 1)

  @NLconstraint(nlp, -0.0401 + 4/x[1] + 2.25/x[2] + 1/x[3] + 0.25/x[4] <= 0)
  @NLconstraint(nlp, -0.010085 + 0.16/x[1] + 0.36/x[2] + 0.64/x[3] + 0.64/x[4] <= 0)
  
  @objective(
    nlp,
    Min,
    1 + x[1] + x[2] + x[3] + x[4]
  )

  return nlp
end