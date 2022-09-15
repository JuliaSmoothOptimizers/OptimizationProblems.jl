export channel

function channel(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  nh = max(2, div(n, 8))

  nc = 4
  nd = 4
  R = 10
  tf = one(T)
  h = tf / nh
  ρ = T[0.06943184420297, 0.33000947820757, 0.66999052179243, 0.93056815579703]
  bc = T[
    0 1
    0 0
  ]
  t = [(i - 1) * h for i = 1:(nh + 1)]
  fact = [j == 0 ? 1 : prod(1:j) for j = 0:(nc + nd)]

  # Define the objective function to minimize
  function f(x)
    return one(T)
  end

  function c(x)
    v = reshape_array(view(x, 1:(4 * nh)), (nh, 4))
    w = reshape_array(view(x, (4 * nh + 1):(8 * nh)), (nh, 4))
    Duc(i, j, s) =
      sum(v[i, k] * (ρ[j] * h)^(k - s) / factorial(k - s) for k = s:nd) +
      h^(nd - s + 1) * sum(w[i, k] * ρ[j]^(k + nd - s) / factorial(k + nd - s) for k = 1:nc)
    return [
      sum(w[i, k] * (ρ[j]^(k - 1) / factorial(k - 1)) for k = 1:nc) -
      R * (Duc(i, j, 2) * Duc(i, j, 3) - Duc(i, j, 1) * Duc(i, j, 4)) for i = 1:nh, j = 1:nc # collocation
    ][:]
  end

  A = spzeros(T, (nh - 1) * nd + 4, 4 * nh + nc * nh)
  A[1, 1] += 1
  A[2, nh + 1] += 1
  for k = 1:nd
    A[3, k * nh] += h^(k - 1) / factorial(k - 1)
  end
  for k = 1:nc
    A[3, k * nh + 4 * nh] += h^nd / factorial(k + nd - 1)
  end
  for k = 2:nd
    A[4, k * nh] += h^(k - 2) / factorial(k - 2)
  end
  for k = 1:nc
    A[4, k * nh + 4 * nh] += h^(nd - 1) / factorial(k + nd - 2)
  end
  for i = 1:(nh - 1), s = 1:nd
    for k = s:nd
      A[4 + (s - 1) * (nh - 1) + i, i + (k - 1) * nh] += h^(k - s) / factorial(k - s)
    end
    for k = 1:nc
      A[4 + (s - 1) * (nh - 1) + i, i + (k - 1 + 4) * nh] += h^(nd - s + 1) / factorial(k + nd - s)
    end
    A[4 + (s - 1) * (nh - 1) + i, i + 1 + (s - 1) * nh] -= 1
  end

  # bounds on the constraints
  lcon = ucon = vcat(bc[1, 1], bc[2, 1], bc[1, 2], bc[2, 2], zeros(T, nd * (nh - 1) + nh * nc))

  x0 = zeros(T, 4 * nh + nc * nh)
  for i = 1:nh
    x0[i] = t[i]^2 * (3 - 2 * t[i])
    x0[nh + i] = 6 * t[i] * (1 - t[i])
    x0[2 * nh + i] = 6 * (1 - 2 * t[i])
    x0[3 * nh + i] = -12
  end

  return ADNLPModels.ADNLPModel(f, x0, A, c, lcon, ucon, name = "channel")
end
