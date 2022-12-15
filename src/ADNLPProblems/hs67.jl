# Hock and Schittkowski problem number 67.
#
#   Source:
#   Problem 67 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GGI-P1-1
#
# Original sources
#
# A.R. Colville, A comparative study on nonlinear programming codes,
# IBM Scientific Center REport 320-2949, New York, 1968.
#
# D.M. Himmelbau, Applied nonlinear programming, McGraw-Hill Book-Company, New York, 1972.
#

export hs67

function hs67(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}

  a = [0, 0, 85, 90, 3, 1 // 100, 145, 5000, 2000, 93, 95, 12, 4, 162]
  function yvec(x)
    y = similar(x, 8)
    y[2] = 16 // 10 * x[1]
    y[3] = 122 // 100 * y[2] - x[1]
    y[6] = (x[2] + y[3]) / x[1]
    yc = 1 // 100 * x[1] * (112 + 13167 // 1000 * y[6] - 6667 // 10000 * y[6]^2)
    while abs(yc - y[2]) > 0.001
      y[2] = yc
      y[3] = 122 // 100 * y[2] - x[1]
      y[6] = (x[2] + y[3]) / x[1]
      yc = 1 // 100 * x[1] * (112 + 13167 // 1000 * y[6] - 6667 // 10000 * y[6]^2)
    end

    y[4] = 93
    y[5] = 8635 // 100 + 1098 // 1000 * y[6] - 38 // 1000 * y[6]^2 + 325 // 1000 * (y[4] - 89)
    y[8] = 3 * y[5] - 133
    y[7] = 3582 // 100 - 222 // 1000 * y[8]
    yc = 98000 * x[3] / (y[2] * y[7] + 1000 * x[3])
    while abs(yc - y[4]) > 0.001
      y[4] = yc
      y[5] = 8635 // 100 + 1098 // 1000 * y[6] - 38 // 1000 * y[6]^2 + 325 // 1000 * (y[4] - 89)
      y[8] = 3 * y[5] - 133
      y[7] = 3582 // 100 - 222 // 1000 * y[8]
      yc = 98000 * x[3] / (y[2] * y[7] + 1000 * x[3])
    end
    return y
  end

  function f(x)
    y = yvec(x)
    return - (63 // 1000 * y[2] * y[5] - 504 // 100 * x[1] - 336 // 100 * y[3] - 35 // 1000 * x[2] - 10 * x[3])
  end
  x0 = T[1745, 12000, 110]
  uvar = T[1e-5, 1e-5, 1e-5]
  lvar = T[2e3, 1.6e4, 1.2e2]
  function c(x)
    y = yvec(x)
    return vcat(
      [y[i+1] - a[i] for i=1:7],
      [a[i] - y[i - 6] for i=8:14]
    )
  end
  lcon = zeros(T, 14)
  ucon = T(Inf) * ones(T, 14)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs67"; kwargs...)
end
