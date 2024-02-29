# Schittkowski problem number 322.
#
#   Source:
#   Problem 322 in
#   Schittkowski, K. (1987). 
#   More Test Examples for Nonlinear Programming Codes. 
#   Lecture Notes in Economics and Mathematical Systems.
#   doi:10.1007/978-3-642-61582-5
#   
#   classification QQR2-AN-2-1
#
#   M. Gollier, Montréal, 05/2023
export hs322

"HS322 model"
function hs322(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:2], start = 0)

  @constraint(nlp, x[1]^2 / 100 + x[2]^2 * 100 - 1 == 0)
  @objective(nlp, Min, (x[1] - 20)^2 + (x[2] + 20)^2)

  return nlp
end
