export hs117

function hs117(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  a = Rational{Int}[-16 2 0 1 0;
                     0 -2 0 4 2;
                    -7 // 2 0 2 0 0;
                     0 -2 0 -4 -1;
                     0 -9 -2 1 -14 // 5;
                     2 0 -4 0 0;
                    -1 -1 -1 -1 -1;
                    -1 -2 -3 -2 -1;
                     1 2 3 4 5;
                     1 1 1 1 1]

  b = [-40, -2, -25 // 100, -4, -4, -1, -40, -60, 5, 1]

  c = [ 30 -20 -10  32 -10;
       -20  39 -6  -31  32;
       -10 -6   10 -6  -10;
        32 -31 -6   39 -20;
       -10  32 -10 -20  30]

  d = [4, 8, 10, 6, 2]

  e = T[-15, -27, -36, -18, -12]
  function f(x; b = b, c = c, d = d)
    return -sum(b[j] * x[j] for j = 1:10) +
           sum(sum(c[k, j] * x[10 + k] * x[10 + j] for k = 1:5) for j = 1:5) +
           2 * sum(d[j] * x[10 + j]^3 for j = 1:5)
  end
  x0 = T(0.001) * [1, 1, 1, 1, 1, 1, 60000, 1, 1, 1, 1, 1, 1, 1, 1]
  lvar = zeros(T, 15)
  uvar = T(Inf) * ones(T, 15)
  function c!(cx, x)
    for j = 1:5
      cx[j] =
        2 * sum(c[k, j] * x[10 + k] + 3 * d[j] * x[10 + j]^2 for k = 1:5) -
        sum(a[k, j] * x[k] for k = 1:10)
    end
    return cx
  end
  lcon = -e
  ucon = T(Inf) * ones(T, 5)
  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "hs117"; kwargs...)
end
