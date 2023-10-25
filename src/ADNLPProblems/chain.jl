export chain

function chain(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  nh = max(2, div(n - 4, 4))

  L = 4
  a = 1
  b = 3
  tmin = b > a ? T(1 // 4) : T(3 // 4)
  tf = one(T)
  h = tf / nh

  # Define the objective function to minimize
  function f(x)
    u = view(x, 1:(nh + 1))
    x1 = view(x, (1 + nh + 1):(2 * (nh + 1)))
    x2 = view(x, (1 + 2 * (nh + 1)):(3 * (nh + 1)))
    x3 = view(x, (1 + 3 * (nh + 1)):(4 * (nh + 1)))
    return x2[nh + 1]
  end

  function c!(cx, x; h = h, nh = nh)
    u = view(x, 1:(nh + 1))
    x1 = view(x, (1 + nh + 1):(2 * (nh + 1)))
    x2 = view(x, (1 + 2 * (nh + 1)):(3 * (nh + 1)))
    x3 = view(x, (1 + 3 * (nh + 1)):(4 * (nh + 1)))
    for j = 1:nh
      cx[j] =
        x2[j + 1] - x2[j] -
        1 // 2 * h * (x1[j] * sqrt(1 + u[j]^2) + x1[j + 1] * sqrt(1 + u[j + 1]^2))
      cx[nh + j] = x3[j + 1] - x3[j] - 1 // 2 * h * (sqrt(1 + u[j]^2) + sqrt(1 + u[j + 1]^2))
    end
    return cx
  end

  A = spzeros(T, nh + 5, 4 * nh + 4)
  A[1:nh, 1:nh] = spdiagm(0 => -1 // 2 * h * ones(T, nh))
  A[1:nh, 2:(nh + 1)] += spdiagm(0 => -1 // 2 * h * ones(T, nh))
  A[1:nh, (1 + nh + 1):(2 * (nh + 1) - 1)] += spdiagm(0 => -ones(T, nh))
  A[1:nh, (2 + nh + 1):(2 * (nh + 1))] += spdiagm(0 => ones(T, nh))
  A[nh + 1, 1 + nh + 1] = 1
  A[nh + 2, 2 * nh + 2] = 1
  A[nh + 3, 1 + 2 * (nh + 1)] = 1
  A[nh + 4, 1 + 3 * (nh + 1)] = 1
  A[nh + 5, 4 * (nh + 1)] = 1

  # bounds on the constraints
  lcon = ucon = vcat(zeros(T, nh), a, b, 0, 0, L, zeros(T, 2 * nh))

  x0 = zeros(T, 4 * nh + 4)
  for k = 1:(nh + 1)
    x0[k] = 4 * abs(b - a) * (k // nh - tmin) # u
    x0[k + nh + 1] = 4 * abs(b - a) * k // nh * (1 // 2 * k // nh - tmin) + a # x[k,1]
    x0[k + 2 * (nh + 1)] = x0[k + nh + 1] * x0[k]
    x0[k + 3 * (nh + 1)] = x0[k]
  end

  return ADNLPModels.ADNLPModel!(f, x0, A, c!, lcon, ucon, name = "chain"; kwargs...)
end
