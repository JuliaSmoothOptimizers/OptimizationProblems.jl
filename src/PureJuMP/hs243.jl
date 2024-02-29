# Hock and Schittkowski problem number 243.
#
#   Source:
#   Problem 243 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs243

"HS243 model"
function hs243(args...; kwargs...)
  nlp = Model()
  x0 = [0.1, 0.1, 0.1]
  @variable(nlp, x[i = 1:3], start = x0[i])

  A = [0.14272; -0.184918; -0.521869; -0.685306]
  B = [
    2.95137 4.87407 -2.0506
    4.87407 9.39321 -3.93181
    -2.0506 -3.93189 2.64745
  ]
  D = [1.75168; -1.35195; -0.479048; -0.3648]
  G = [
    -0.564255 0.392417 -0.404979
    0.927589 -0.0735083 0.535393
    0.658799 -0.636666 -0.681091
    -0.869487 0.586387 0.289826
  ]

  @objective(
    nlp,
    Min,
    sum(
      (
        A[j] +
        sum(G[j, k] * x[k] for k = 1:3) +
        0.5 * sum(x[l] * sum(B[l, k] * x[k] for k = 1:3) for l = 1:3) * D[j]
      )^2 for j = 1:4
    )
  )

  return nlp
end
