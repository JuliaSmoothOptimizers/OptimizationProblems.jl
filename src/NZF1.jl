# "Philippe Toint (private communication)"

# classification SUR2-AN-V-0

# A. Montoison, Montreal, 05/2018.

export NZF1

function NZF1(n :: Int=13)
  
  mod(n,13) != 0 && @warn("NZF1: number of variables adjusted to be divisible by 13")
  nbis = max(1,div(n,13))
  n = 13*nbis

  l = div(n,13)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=1)

  @NLobjective(
    nlp,
    Min,
    sum(
      (3*x[i] - 60 + 1/10*(x[i+1] - x[i+2])^2)^2
      + (x[i+1]^2 + x[i+2]^2 + (x[i+3]^2)*(1+x[i+3])^2 + x[i+6] + x[i+5]/(1 + x[i+4]^2 + sin(x[i+4]/1000)))^2
      + (x[i+6] + x[i+7] - x[i+8]^2 + x[i+10])^2
      + (log(1 + x[i+10]^2) + x[i+11] - 5*x[i+12] + 20)^2
      + (x[i+4] + x[i+5] + x[i+5]*x[i+9] + 10*x[i+9] - 50)^2 
      for i = 1:l
    )
    + sum((x[i+6]-x[i+19])^2 for i=1:l-1)
  )

  return nlp
end
