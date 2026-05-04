export elec

function elec(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_orig = n
  m = max(2, div(n_orig, 3))
  n = 3 * m
  @adjust_nvar_warn("elec", n_orig, n)
  # Define the objective function to minimize
  function f(x; n = n)
    return sum(
      sum(
        1 / sqrt((x[j] - x[i])^2 + (x[m + j] - x[m + i])^2 + (x[2m + j] - x[2m + i])^2) for
        j = (i + 1):m
      ) for i = 1:(m - 1)
    )
  end

  # Define the constraints on these points (sum of the square of the coordinates = 1)
  function c!(cx, x; n = n)
    for k = 1:m
      cx[k] = x[k]^2 + x[m + k]^2 + x[2m + k]^2
    end
    return cx
  end

  # bounds on the constraints
  lcon = ucon = ones(T, m)

  # building a feasible x0
  range0 = T[i / m for i = 1:m]

  θ0 = 2π .* range0
  ϕ0 = π .* range0
  xini = T[sin(θ0[i]) * cos(ϕ0[i]) for i = 1:m] # x coordinate
  yini = T[sin(θ0[i]) * sin(ϕ0[i]) for i = 1:m] # y coordinate 
  zini = T[cos(θ0[i]) for i = 1:m]            # z coordinate
  x0 = [xini; yini; zini]

  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "elec"; kwargs...)
end
