#   The classical problem of the hanging catenary.  Here the catenary consists
#   of N+1 beams of length BL, with the first beam fixed at the origin and
#   the final bean fixed at a fraction FRACT of the total length of all
#   beams.
#
#   The problem is non-convex.
#
#   Source: 
#   K. Veselic,
#   "De forma catenarum in campo gravitatis pendentium",
#   Klasicna Gimnazija u Zagrebu, Zagreb, 1987.
#
#   classification LQR2-AY-V-V
#
#   M. Gollier, Montréal, 05/2023

export catenary

function catenary(args...; n::Int = default_nvar, kwargs...) 
  (n % 3 == 0) || @warn("catenary: number of variables adjusted to be a multiple of 3")
  n = 3 * max(1, div(n, 3))
  (n<6)|| @warn("catenary: number of variables adjusted to be greater or equal to 6")
  n = max(n,6)

  ## Model Parameters

  N = div(n,3) - 2
  Bl = 1.0
  FRACT = 0.6
  d = Bl*(N+1)*FRACT

  gamma = 9.81
  tmass = 500.0
  mass = tmass/(N+1)
  mg = gamma*mass

  nlp = Model()

  lvar = -Inf*ones(n)
  uvar = Inf*ones(n)
  lvar[1:3] .= 0
  uvar[1:3] .= 0
  lvar[n-2] = d
  uvar[n-2]  = d

  x0 = zeros(n)
  for i in 0:N+1
    x0[1+3*i] = i*d/(N+1)
    x0[2+3*i] = -i*d/(N+1)
  end


  @variable(nlp,lvar[i]<= x[i=1:n]<=uvar[i],start = x0[i])

  @objective(nlp, Min, mg*x[2]/2 + sum(mg*x[2+3*i] for i = 1:N) + mg*x[3*N+5]/2)

  @NLconstraint(nlp,c[i=1:N+1],(x[1+3*i]-x[-2+3*i])^2 + (x[2+3*i]-x[-1+3*i])^2 + (x[3+3*i]-x[3*i])^2 - Bl^2==0)

  return nlp
end
