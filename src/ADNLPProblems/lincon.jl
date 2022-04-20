export lincon

function lincon(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  A = [1 2; 3 4]
  b = [5; 6]
  B = LinearAlgebra.diagm([3 * i for i = 3:5])
  c = [1; 2; 3]
  C = [0 -2; 4 0]
  d = [1; -1]

  x0 = zeros(T, 15)
  f(x) = sum(i + x[i]^4 for i = 1:15)
  con(x) = [
    15 * x[15]
    C * x[6:7]
    c' * x[10:12]
    A * x[1:2]
    d' * x[13:14]
    B * x[3:5]
    b' * x[8:9]
  ]

  lcon = T[22; -d; 1; -b; -Inf; -Inf * ones(3); -11]
  ucon = T[22; -d; Inf; Inf * ones(2); 16; c; 9]

  return ADNLPModels.ADNLPModel(f, x0, con, lcon, ucon, name = "lincon", lin = collect(1:11); kwargs...)
end
