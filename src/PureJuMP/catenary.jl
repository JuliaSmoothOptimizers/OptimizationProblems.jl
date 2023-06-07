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

function catenary(args...; n::Int = default_nvar, kwargs...) where {T}
  (n % 3 == 0) || @warn("catenary: number of variables adjusted to be a multiple of 3")
  n = 3 * max(1, div(n, 3))
  (n<9)|| @warn("catenary: number of variables adjusted to be greater or equal to 9")
  n = max(n,9)

  ## Model Parameters
  N = Int(n/3) - 1
  Bl = 1
  FRACT = 0.6
  d = (N+1)*FRACT
  nlp = Model()

  lvar = -Inf*ones(n)
  uvar = Inf*ones(n)
  lvar[1:3] .= 0
  uvar[1:3] .= 0
  lvar[n-1:n] .= 0
  uvar[n-1:n] .= 0
  lvar[n-2] = d
  uvar[n-2]  = d

  @variable(nlp,lvar[i]<= x[i=1:n]<=uvar[i],start = 0)

  @objective(nlp, Min, sum(x[2+3*i] for i = 1:N))

  @NLconstraint(nlp,c[i=1:N],(x[1+3*i]-x[-2+3*i])^2 + (x[2+3*i]-x[-1+3*i])^2 + (x[3+3*i]-x[3*i])^2 - Bl^2==0)

  return nlp
end
