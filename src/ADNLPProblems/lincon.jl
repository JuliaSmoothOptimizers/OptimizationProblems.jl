export lincon

function lincon(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  A = [1 2; 3 4]
  b = [5; 6]
  B = LinearAlgebra.diagm([3 * i for i = 3:5])
  c = [1; 2; 3]
  C = [0 -2; 4 0]
  d = [1; -1]

  x0 = zeros(T, 15)
  f(x) = sum(i + x[i]^4 for i = 1:15)
  clinvals = vcat(T[15], C[1, :], C[2, :], c, A[1, :], A[2, :], d, T[3 * i for i = 3:5], b)
  clincols =
    vcat([15], [6; 7], [6; 7], [10; 11; 12], [1; 2], [1; 2], [13; 14], [3], [4], [5], [8; 9])
  clinrows = vcat([1], [2; 2], [3; 3], [4; 4; 4], [5; 5], [6; 6], [7; 7], [8], [9], [10], [11; 11])

  lcon = T[22; -d; 1; -b; -Inf; -Inf * ones(3); -11]
  ucon = T[22; -d; Inf; Inf * ones(2); 16; c; 9]

  return ADNLPModels.ADNLPModel(
    f,
    x0,
    clinrows,
    clincols,
    clinvals,
    lcon,
    ucon,
    name = "lincon";
    kwargs...,
  )
end
