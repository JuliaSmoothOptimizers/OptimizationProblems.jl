export elec

function elec(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n = max(2, div(n, 3))
  # Define the objective function to minimize
  function f(x)
    return sum(
      sum(
        1 / sqrt((x[j] - x[i])^2 + (x[n + j] - x[n + i])^2 + (x[2n + j] - x[2n + i])^2) for
        j = (i + 1):n
      ) for i = 1:(n - 1)
    )
  end

  # Define the constraints on these points (sum of the square of the coordinates = 1)
  function c(x)
    return [x[k]^2 + x[n + k]^2 + x[2n + k]^2 - 1 for k = 1:n]
  end

  # bounds on the constraints
  lcon = ucon = zeros(T, n)

  # building a feasible x0
  range0 = T[i / n for i = 1:n]

  θ0 = 2π .* range0
  ϕ0 = π .* range0
  xini = T[sin(θ0[i]) * cos(ϕ0[i]) for i = 1:n] # x coordinate
  yini = T[sin(θ0[i]) * sin(ϕ0[i]) for i = 1:n] # y coordinate 
  zini = T[cos(θ0[i]) for i = 1:n]            # z coordinate
  x0 = [xini; yini; zini]

  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "elec"; kwargs...)
end
