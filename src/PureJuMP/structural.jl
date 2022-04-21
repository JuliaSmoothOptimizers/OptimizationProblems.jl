
# JuMP model follows Laurent Lessard CS/ECE/ISyE 524, University of Wisconsin–Madison, 
# Introduction to Optimization class.
# https://laurentlessard.com/teaching/524-intro-to-optimization/

export structural

function structural(args...; n::Int = default_nvar, kwargs...)
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
  nodes = [kron(ones(Ny), collect(1:Nx)) kron(collect(1:Ny), ones(Nx))]

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

  ℓ = zeros(M)
  nx = zeros(N, M)
  ny = zeros(N, M)
  for j = 1:M
    i1 = edges[j, 1]
    i2 = edges[j, 2]
    ℓ[j] = norm([nodes[i1, 1] - nodes[i2, 1], nodes[i1, 2] - nodes[i2, 2]])
    nx[i1, j] = (nodes[i1, 1] - nodes[i2, 1]) / ℓ[j]
    nx[i2, j] = (nodes[i2, 1] - nodes[i1, 1]) / ℓ[j]
    ny[i1, j] = (nodes[i1, 2] - nodes[i2, 2]) / ℓ[j]
    ny[i2, j] = (nodes[i2, 2] - nodes[i1, 2]) / ℓ[j]
  end

  fx = zeros(N)
  fy = zeros(N)
  for L in loaded
    ind = L[1]
    fx[ind] = L[2]
    fy[ind] = L[3]
  end

  nlp = Model()

  @variable(nlp, x[1:M] >= 0)   # area of edge from i to j
  @variable(nlp, u[1:M])       # force in edge from i to j

  for i = 1:N
    if i in fixed
      continue
    else
      @constraint(nlp, sum(u[j] * nx[i, j] for j = 1:M) == -fx[i])
    end
  end

  for i = 1:N
    if i in fixed
      continue
    else
      @constraint(nlp, sum(u[j] * ny[i, j] for j = 1:M) == -fy[i])
    end
  end

  @constraint(nlp, -x + u .<= 0)
  @constraint(nlp, u - x .<= 0)

  @objective(nlp, Min, sum(ℓ[j] * x[j] for j = 1:M))

  return nlp
end
