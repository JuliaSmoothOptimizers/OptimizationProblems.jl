# Sparse modification of the Nazareth trigonometric function
#
#   Problem 8 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
export nazareth

function nazareth(; n::Int = default_nvar, type::Type{T} = Float64) where {T}
  nh = div(n, 2)
  neighbors = Vector{Vector{Int}}(undef, n)
  a_row = Vector{Vector{T}}(undef, n)
  b_row = Vector{Vector{T}}(undef, n)
  for i in 1:n
    lo = max(1, i - 2)
    hi = min(n, i + 2)
    neigh = collect(lo:hi)
    j1 = i - nh
    j2 = i + nh
    for j in (j1, j2)
      if 1 <= j <= n && !(j >= lo && j <= hi)
        push!(neigh, j)
      end
    end
    neighbors[i] = neigh
    a_row[i] = [5 * (1 + mod(i, 5) + mod(j, 5)) for j in neigh]
    b_row[i] = [(i + j) / 10 for j in neigh]
  end

  nlp = Model()
  @variable(nlp, x[1:n], start = one(T) / n)

  @objective(nlp, Min,
    sum(
      (n + i - sum(a_row[i][k] * sin(x[ neighbors[i][k] ]) + b_row[i][k] * cos(x[ neighbors[i][k] ]) for k in 1:length(neighbors[i])))^2
      for i = 1:n
    ) / n
  )
  return nlp
end
