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

  @variable(nlp, x[i=0:(N+1)],start=0)
  @variable(nlp, y[i=0:(N+1)],start=0)
  @variable(nlp, z[i=0:(N+1)],start=0)


  @NLobjective(nlp, Min, sum(y[i] for i = 1:N))

  @constraint(nlp,x[0]==0)
  @constraint(nlp,y[0]==0)
  @constraint(nlp,z[0]==0)
  @constraint(nlp,x[N+1]==d)
  @constraint(nlp,y[N+1]==0)
  @constraint(nlp,z[N+1]==0)

  @constraint(nlp,c[i=1:N+1],(x[i]-x[i-1])^2+(y[i]-y[i-1])^2+(z[i]-z[i-1])^2==Bl^2)

  return nlp
end
