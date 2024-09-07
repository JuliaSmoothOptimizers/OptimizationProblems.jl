export marine

function marine(; n::Int = default_nvar, nc::Int = 1, type::Type{T} = Float64, kwargs...) where {T}
  nc = max(min(nc, 4), 1) # number of collocation points 
  ne = 8 # number of differential equations
  nm = 21 # number of measurements

  n = max(n, 3 * ne * nc + ne + 2 * ne)
  nh = Int(round((n - 2 * ne + 1) / (3 * ne * nc + ne))) # number of partition intervals

  # roots of k-th degree Legendre polynomial
  rho = if nc == 1
    0.5
  elseif nc == 2
    [0.21132486540519; 0.78867513459481]
  elseif nc == 3
    [0.11270166537926; 0.50000000000000; 0.88729833462074]
  elseif nc == 4
    [0.06943184420297; 0.33000947820757; 0.66999052179243; 0.93056815579703]
  end

  # times at which observations made
  tau = Rational{Int}[
    0.0
    0.5
    1.0
    1.5
    2.0
    2.5
    3.0
    3.5
    4.0
    4.5
    5.0
    5.5
    6.0
    6.5
    7.0
    7.5
    8.0
    8.5
    9.0
    9.5
    10.0
  ]

  # ODEs defined in [0,tf]        
  tf = tau[nm]
  h = tf // nh # uniform interval length
  t = [(i - 1) * h for i = 1:(nh + 1)] # partition

  fact = ones(Int, nc + 1)
  for j = 1:nc
    fact[j + 1] = prod(i for i = 1:j)
  end

  # itau[i] is the largest integer k with t[k] <= tau[i]
  itau = [Int(min(nh, floor(tau[i] / h) + 1)) for i = 1:nm]

  # observations
  z = [
    20000 17000 10000 15000 12000 9000 7000 3000
    12445 15411 13040 13338 13484 8426 6615 4022
    7705 13074 14623 11976 12453 9272 6891 5020
    4664 8579 12434 12603 11738 9710 6821 5722
    2977 7053 11219 11340 13665 8534 6242 5695
    1769 5054 10065 11232 12112 9600 6647 7034
    943 3907 9473 10334 11115 8826 6842 7348
    581 2624 7421 10297 12427 8747 7199 7684
    355 1744 5369 7748 10057 8698 6542 7410
    223 1272 4713 6869 9564 8766 6810 6961
    137 821 3451 6050 8671 8291 6827 7525
    87 577 2649 5454 8430 7411 6423 8388
    49 337 2058 4115 7435 7627 6268 7189
    32 228 1440 3790 6474 6658 5859 7467
    17 168 1178 3087 6524 5880 5562 7144
    11 99 919 2596 5360 5762 4480 7256
    7 65 647 1873 4556 5058 4944 7538
    4 44 509 1571 4009 4527 4233 6649
    2 27 345 1227 3677 4229 3805 6378
    1 20 231 934 3197 3695 3159 6454
    1 12 198 707 2562 3163 3232 5566
  ]

  g0 = zeros(T, ne - 1)

  m0 = zeros(T, ne)

  v0 = zeros(T, nh, ne)
  for i = 1:tau[1], s = 1:ne
    v0[i, s] = z[1, s]
  end
  for j = 2:nm, i = (itau[j - 1] + 1):itau[j], s = 1:ne
    v0[i, s] = z[j, s]
  end
  for i = (itau[nm] + 1):nh, s = 1:ne
    v0[i, s] = z[nm, s]
  end

  w0 = zeros(T, nh, nc, ne)

  uc0 = zeros(T, nh, nc, ne)
  for i = 1:nh, j = 1:nc, s = 1:ne
    uc0[i, j, s] = v0[i, s] + h * sum(w0[i, k, s] * (rho[j]^k / fact[k + 1]) for k = 1:nc)
  end

  Duc0 = zeros(T, nh, nc, ne)
  for i = 1:nh, j = 1:nc, s = 1:ne
    Duc0[i, j, s] = sum(w0[i, k, s] * (rho[j]^(k - 1) / fact[k]) for k = 1:nc)
  end

  x0 = vcat(
    g0, # ne - 1
    m0, # ne
    v0[:], # nh * ne
    w0[:], # nh * nc * ne
    uc0[:], # nh * nc * ne
    Duc0[:], # nh * nc * ne
  )
  lvar = vcat(zeros(T, 2 * ne - 1), -T(Inf) * ones(T, length(x0) - 2 * ne + 1))
  uvar = T(Inf) * ones(T, length(x0))

  function f(x; ne = ne, nh = nh, nc = nc, tau = tau, itau = itau, fact = fact, h = h, z = z)
    ngm = 2 * ne - 1
    ngmv = ngm + nh * ne
    ngmw = ngmv + nh * nc * ne
    v = reshape_array(view(x, (ngm + 1):(ngmv)), (nh, ne))
    w = reshape_array(view(x, (ngmv + 1):(ngmw)), (nh, nc, ne))
    return sum(
      sum(
        (
          v[itau[j], s] + (sum(
            w[itau[j], k, s] * (tau[j] - t[itau[j]])^k / (fact[k + 1] * h^(k - 1)) for k = 1:nc
          )) - z[j, s]
        )^2 for s = 1:ne
      ) for j = 1:nm
    )
  end

  ncon = (nh - 1) * ne + nh * nc + nh * nc * (ne - 2) + nh * nc
  lcon = ucon = zeros(T, ncon)

  A = zeros(T, (nh - 1) * ne, length(x0))
  ngm = 2 * ne - 1
  ngmv = ngm + nh * ne
  for i = 1:(nh - 1), s = 1:ne
    A[i + (s - 1) * (nh - 1), ngm + i + (s - 1) * nh] = 1
    A[i + (s - 1) * (nh - 1), ngm + i + (s - 1) * nh + 1] = -1
    for j = 1:nc
      A[i + (s - 1) * (nh - 1), ngmv + i + (s - 1) * nh + (j - 1) * nc] = h / fact[j + 1]
    end
  end

  function c!(
    cx,
    x;
    ne::Int = ne,
    nh::Int = nh,
    nc::Int = nc,
    h::Rational{Int} = h,
    fact::Vector{Int} = fact,
    ngm::Int = ngm,
    ngmv::Int = ngmv,
  )
    g = view(x, 1:(ne - 1))
    m = view(x, ne:ngm)
    ngmw = ngmv + nh * nc * ne
    v = reshape_array(view(x, (ngm + 1):(ngmv)), (nh, ne))
    w = reshape_array(view(x, (ngmv + 1):(ngmw)), (nh, nc, ne))
    nuc = ngmw + nh * nc * ne
    uc = reshape_array(view(x, (ngmw + 1):(nuc)), (nh, nc, ne))
    Duc = reshape_array(view(x, (nuc + 1):(nuc + nh * nc * ne)), (nh, nc, ne))

    # continuity
    #for i = 1:(nh - 1), s = 1:ne
    #  cx[i + (s - 1) * (nh - 1)] =
    #    v[i, s] + h * sum(w[i, j, s] / fact[j + 1] for j = 1:nc) - v[i + 1, s]
    #end
    for i = 1:nh, j = 1:nc
      cx[i + (j - 1) * nh] = Duc[i, j, 1] + (m[1] + g[1]) * uc[i, j, 1]
    end
    ncx = nc * nh
    for i = 1:nh, j = 1:nc, s = 2:(ne - 1)
      cx[ncx + i + (j - 1) * nh + (s - 2) * nh * nc] =
        Duc[i, j, s] - g[s - 1] * uc[i, j, s - 1] + (m[s] + g[s]) * uc[i, j, s]
    end
    ncx += nh * nc * (ne - 2)
    for i = 1:nh, j = 1:nc
      cx[ncx + i + (j - 1) * nh] =
        Duc[i, j, ne] - g[ne - 1] * uc[i, j, ne - 1] + m[ne] * uc[i, j, ne]
    end
    return cx
  end

  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    findnz(sparse(A))...,
    c!,
    lcon,
    ucon,
    name = "marine";
    kwargs...,
  )
end
