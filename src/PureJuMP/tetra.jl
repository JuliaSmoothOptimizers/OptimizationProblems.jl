# Minimize the sum of the inverse weighted mean ratio of the elements in a fixed–boundary
# tetrahedral mesh by adjusting the locations of the free vertices.

#  This is problem 19 in the COPS (Version 3) collection of 
#   E. Dolan and J. More
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

include("../../data/tetra.jl")
export tetra

function tetra(
  x0 = xe_tetra,
  TETS::Vector{Int64} = Tets_tetra,
  Const::Vector{Int64} = Constants_tetra;
  kwargs...,
)
  τ = 0.0
  n = length(x0)
  N = round(Int, n / 3)
  E = round(Int, length(TETS) / 4)

  lvar = -Inf * ones(n)
  lvar[Const] = x0[Const]
  lvar[Const .+ N] = x0[Const .+ N]
  lvar[Const .+ 2 * N] = x0[Const .+ 2 * N]

  uvar = Inf * ones(n)
  uvar[Const] = x0[Const]
  uvar[Const .+ N] = x0[Const .+ N]
  uvar[Const .+ 2 * N] = x0[Const .+ 2 * N]

  nlp = Model()

  @variable(nlp, lvar[i] <= x[i = 1:n] <= uvar[i], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    sum(
      (sum(
        (1 * x[TETS[e + E] + N * i] - x[TETS[e] + N * i])^2 +
        (2 * x[TETS[e + 2 * E] + N * i] - x[TETS[e + E] + N * i] - x[TETS[e] + N * i])^2 / 3 +
        (
          3 * x[TETS[e + 3 * E] + N * i] - x[TETS[e + 2 * E] + N * i] - x[TETS[e + E] + N * i] -
          x[TETS[e] + N * i]
        )^2 / 6 for i = 0:2
      )) / (
        3 *
        (sum(
          (x[TETS[e + E] + N * i] - x[TETS[e] + N * i]) *
          (
            (x[TETS[e + 2 * E] + N * mod(i + 1, 3)] - x[TETS[e] + N * mod(i + 1, 3)]) *
            (x[TETS[e + 3 * E] + N * mod(i - 1, 3)] - x[TETS[e] + N * mod(i - 1, 3)]) -
            (x[TETS[e + 2 * E] + N * mod(i - 1, 3)] - x[TETS[e] + N * mod(i - 1, 3)]) *
            (x[TETS[e + 3 * E] + N * mod(i + 1, 3)] - x[TETS[e] + N * mod(i + 1, 3)])
          ) *
          sqrt(2) for i = 0:2
        ))^(2 / 3)
      ) for e = 1:E
    )
  )

  for e = 1:E
    @NLconstraint(
      nlp,
      sum(
        (x[TETS[e + E] + N * i] - x[TETS[e] + N * i]) *
        (
          (x[TETS[e + 2 * E] + N * mod(i + 1, 3)] - x[TETS[e] + N * mod(i + 1, 3)]) *
          (x[TETS[e + 3 * E] + N * mod(i - 1, 3)] - x[TETS[e] + N * mod(i - 1, 3)]) -
          (x[TETS[e + 2 * E] + N * mod(i - 1, 3)] - x[TETS[e] + N * mod(i - 1, 3)]) *
          (x[TETS[e + 3 * E] + N * mod(i + 1, 3)] - x[TETS[e] + N * mod(i + 1, 3)])
        ) *
        sqrt(2) for i = 0:2
      ) >= τ
    )
  end

  return nlp
end

include("../../data/tetra_duct12.jl")
export tetra_duct12
tetra_duct12(; kwargs...) = tetra(xe_duct12, TETS_duct12, Const_duct12; kwargs...)

include("../../data/tetra_duct15.jl")
export tetra_duct15
tetra_duct15(; kwargs...) = tetra(xe_duct15, TETS_duct15, Const_duct15; kwargs...)

include("../../data/tetra_duct20.jl")
export tetra_duct20
tetra_duct20(; kwargs...) = tetra(xe_duct20, TETS_duct20, Const_duct20; kwargs...)

include("../../data/tetra_hook.jl")
export tetra_hook
tetra_hook(; kwargs...) = tetra(xe_hook, TETS_hook, Const_hook; kwargs...)

include("../../data/tetra_foam5.jl")
export tetra_foam5
tetra_foam5(; kwargs...) = tetra(xe_foam5, TETS_foam5, Const_foam5; kwargs...)

include("../../data/tetra_gear.jl")
export tetra_gear
tetra_gear(; kwargs...) = tetra(xe_gear, TETS_gear, Const_gear; kwargs...)
