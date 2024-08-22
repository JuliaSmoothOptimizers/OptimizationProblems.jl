export allinit

function allinit(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return x[3] - 1 + x[1]^2 + x[2]^2 + (x[3] + x[4])^2 + sin(x[3])^2 + x[1]^2 * x[2]^2 + x[4] - 3 +
           sin(x[3])^2 +
           (x[4] - 1)^2 +
           (x[2]^2)^2 +
           (x[3]^2 + (x[4] + x[1])^2)^2 +
           (x[1] - 4 + sin(x[4])^2 + x[2]^2 * x[3]^2)^2 +
           sin(x[4])^4
  end
  x0 = zeros(T, 4)
  lvar = -T(Inf) * ones(T, 4)
  uvar = T(Inf) * ones(T, 4)

  #function c!(cx, x)
  #  cx[3] = x[4]
  #  cx[1] = x[2]
  #  cx[2] = x[3]
  #  return cx
  #end
  A = T[
    0 0 0 1;
    0 1 0 0;
    0 0 1 0
  ]

  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    lvar,
    uvar,
    findnz(sparse(A))...,
    (cx, x) -> cx,
    T[2, 1, -1e+10],
    T[2, Inf, 1],
    name = "allinit",
    minimize = true;
    kwargs...,
  )
end
