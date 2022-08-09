export structural

function structural(
  args...;
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  n = max(n, 100)

  sub2ind(shape, a, b) = LinearIndices(shape)[CartesianIndex.(a, b)]
  Nx = min(Int(round(n^(1 / 3))), 6)
  Ny = Int(round(n^(1 / 3)))
  # FIXED NODES
  fixed = [sub2ind((Nx, Ny), i, 1) for i = 3:Nx]

  # crunching
  #loaded = [ (sub2ind((Nx,Ny),i,Ny), 0,1) for i = 4:5 ]

  # uniform lateral load
  loaded1 = [(sub2ind((Nx, Ny), 4, j), 1, 0) for j = 1:Ny]
  loaded2 = [(sub2ind((Nx, Ny), 5, j), 1, 0) for j = 1:Ny]
  loaded = [loaded1; loaded2]
  N = Nx * Ny  # number of nodes

  # NODES: columns are x and y components respectively
  nodes = [kron(ones(T, Ny), collect(1:Nx)) kron(collect(1:Ny), ones(T, Nx))]

  M = Int(N * (N - 1) / 2)  # number of edges

  # EDGES: columns are the indices of the nodes at either end
  edges = Array{Int}(zeros(M, 2))

  k = 0
  for i = 1:N
    for j = 1:(i - 1)
      k = k + 1
      edges[k, :] = [i j]
    end
  end

  ℓ = zeros(T, M)
  nx = zeros(T, N, M)
  ny = zeros(T, N, M)
  for j = 1:M
    i1 = edges[j, 1]
    i2 = edges[j, 2]
    ℓ[j] = norm([nodes[i1, 1] - nodes[i2, 1], nodes[i1, 2] - nodes[i2, 2]])
    nx[i1, j] = (nodes[i1, 1] - nodes[i2, 1]) / ℓ[j]
    nx[i2, j] = (nodes[i2, 1] - nodes[i1, 1]) / ℓ[j]
    ny[i1, j] = (nodes[i1, 2] - nodes[i2, 2]) / ℓ[j]
    ny[i2, j] = (nodes[i2, 2] - nodes[i1, 2]) / ℓ[j]
  end

  fx = zeros(T, N)
  fy = zeros(T, N)
  for L in loaded
    ind = L[1]
    fx[ind] = L[2]
    fy[ind] = L[3]
  end
  function f(y)
    x, u = y[1:M], y[(M + 1):(2 * M)]
    return sum(ℓ[j] * x[j] for j = 1:M)
  end
  A = [
    spzeros(T, length(setdiff(1:N, fixed)), M) nx[setdiff(1:N, fixed), :]
    spzeros(T, length(setdiff(1:N, fixed)), M) ny[setdiff(1:N, fixed), :]
    spdiagm(0 => -ones(T, M)) spdiagm(0 => ones(T, M))
    spdiagm(0 => -ones(T, M)) spdiagm(0 => ones(T, M))
  ]
  lcon = vcat(-fx[setdiff(1:N, fixed)], -fy[setdiff(1:N, fixed)], -T(Inf) * ones(T, 2 * M))
  ucon = vcat(-fx[setdiff(1:N, fixed)], -fy[setdiff(1:N, fixed)], zeros(T, 2 * M))
  x0 = zeros(T, 2 * M)
  lvar = vcat(zeros(T, M), -T(Inf) * ones(T, M))
  uvar = T(Inf) * ones(T, 2 * M)
  return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    sparse(A),
    lcon,
    ucon,
    name = "structural";
    kwargs...,
  )
end
