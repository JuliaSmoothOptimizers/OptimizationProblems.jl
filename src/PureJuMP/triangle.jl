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

  @objective(
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
    @constraint(
      nlp,
      2 * (
        (x[TRIS[e + E]] - x[TRIS[e]]) * (x[TRIS[e + 2 * E] + N] - x[TRIS[e] + N]) -
        (x[TRIS[e + 2 * E]] - x[TRIS[e]]) * (x[TRIS[e + E] + N] - x[TRIS[e] + N])
      ) / sqrt(3) >= τ
    )
  end

  return nlp
end

export triangle_deer
function triangle_deer(; kwargs...)
  _ensure_data!(:triangle_deer, "triangle_deer.jl")
  tetra(xe_deer, TRIS_deer, Const_deer; name = "triangle_deer", kwargs...)
end

export triangle_pacman
function triangle_pacman(; kwargs...)
  _ensure_data!(:triangle_pacman, "triangle_pacman.jl")
  tetra(xe_pacman, TRIS_pacman, Const_pacman; name = "triangle_pacman", kwargs...)
end

export triangle_turtle
function triangle_turtle(; kwargs...)
  _ensure_data!(:triangle_turtle, "triangle_turtle.jl")
  tetra(xe_turtle, TRIS_turtle, Const_turtle; name = "triangle_turtle", kwargs...)
end
