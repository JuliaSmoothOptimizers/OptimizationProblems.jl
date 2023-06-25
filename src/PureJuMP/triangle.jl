# Minimize the time taken for a robot arm to travel between two points.

#  This is problem 18 in the COPS (Version 3) collection of 
#   E. Dolan and J. More
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

include("../../data/triangle.jl")
export triangle

function triangle(x0 = xe, TRIS::Vector{Int64} = Tr, Const::Vector{Int64} = Constants; kwargs...)
  τ = 0.0
  n = length(x0)
  N = Int(div(n, 2))
  E = Int(div(length(TRIS), 3))

  lvar = -Inf * ones(n)
  lvar[Const] = x0[Const]
  lvar[Const .+ N] = x0[Const .+ N]

  uvar = Inf * ones(n)
  uvar[Const] = x0[Const]
  uvar[Const .+ N] = x0[Const .+ N]

  nlp = Model()

  @variable(nlp, lvar[i] <= x[i = 1:n] <= uvar[i], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    sum(
      sum(
        (1 * x[TRIS[e + E] + N * i] - x[TRIS[e] + N * i])^2 +
        (2 * x[TRIS[e + 2 * E] + N * i] - x[TRIS[e + E] + N * i] - x[TRIS[e] + N * i])^2 / 3 for
        i = 0:1
      ) / (
        2 * (
          2 * (
            (x[TRIS[e + E]] - x[TRIS[e]]) * (x[TRIS[e + 2 * E] + N] - x[TRIS[e] + N]) -
            (x[TRIS[e + 2 * E]] - x[TRIS[e]]) * (x[TRIS[e + E] + N] - x[TRIS[e] + N])
          ) / sqrt(3)
        )
      ) for e = 1:E
    )
  )

  for e = 1:E
    @NLconstraint(
      nlp,
      2 * (
        (x[TRIS[e + E]] - x[TRIS[e]]) * (x[TRIS[e + 2 * E] + N] - x[TRIS[e] + N]) -
        (x[TRIS[e + 2 * E]] - x[TRIS[e]]) * (x[TRIS[e + E] + N] - x[TRIS[e] + N])
      ) / sqrt(3) >= τ
    )
  end

  return nlp
end

include("../../data/triangle_deer.jl")
export triangle_deer
triangle_deer(; kwargs...) = triangle(xe_deer, TRIS_deer, Const_deer; kwargs...)

include("../../data/triangle_pacman.jl")
export triangle_pacman
triangle_pacman(; kwargs...) = triangle(xe_pacman, TRIS_pacman, Const_pacman; kwargs...)

include("../../data/triangle_turtle.jl")
export triangle_turtle
triangle_turtle(; kwargs...) = triangle(xe_turtle, TRIS_turtle, Const_turtle; kwargs...)
