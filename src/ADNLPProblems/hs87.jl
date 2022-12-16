export hs87

function hs87(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f1(x)
    return if 0 <= x <= 300
      30 * x
    elseif 300 <= x <= 400
      31 * x
    else
      eltype(x)(Inf)
    end
  end

  function f2(x)
    return if 0 <= x <= 100
      28 * x
    elseif 100 <= x <= 200
      29 * x
    elseif 200 <= x <= 1000
      30 * x
    else
      eltype(x)(Inf)
    end
  end
  function f(x)
    return f1(x[1]) + f2(x[2])
  end

  x0 = T[390, 1000, 419.5, 340.5, 198.175, 0.5]
  lvar = T[0, 0, 340, 340, -1000, 0]
  uvar = T[400, 1000, 420, 420, 10000, 0.5236]

  a = 131078 // 1000
  b = 148577 // 100000
  ci = 90798 // 100000
  d = cos(147588 // 100000)
  e = sin(147588 // 100000)

  function c(x)
    return [
      300 - x[1] - (1000 // 131078) * x[3] * x[4] * cos(b - x[6]) +
      ci * (1000 // 131078) * d * x[3]
      -x[2] - (1000 // 131078) * x[3] * x[4] * cos(b + x[6]) + ci * (1000 // 131078) * d * x[4]^2
      -x[5] - (1000 // 131078) * x[3] * x[4] * cos(b + x[6]) + ci * (1000 // 131078) * e * x[4]^2
      200 - (1000 // 131078) * x[3] * x[4] * sin(b - x[6]) + ci * (1000 // 131078) * e * x[3]^2
    ]
  end
  lcon = zeros(T, 4)
  ucon = zeros(T, 4)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs87"; kwargs...)
end
