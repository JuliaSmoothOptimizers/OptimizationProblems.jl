export auglag

function auglag(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  λ₁ = T(-0.002008)
  λ₂ = T(-0.001900)
  λ₃ = T(-0.000261)

  function f(x; n = length(x))
    s = zero(T)
    for i = 1:n
      if mod(i, 5) == 0
        prod_term = one(T)
        sum_sq = zero(T)
        for j = 1:5
          idx = i + 1 - j
          if 1 <= idx <= n
            prod_term *= x[idx]
            sum_sq += x[idx]^2
          end
        end
        s += exp(prod_term) + 10 * (sum_sq - 10 - λ₁)^2

        if i >= 4
          s += 10 * (x[i - 3] * x[i - 2] - 5 * x[i - 1] * x[i] - λ₂)^2
        end

        if i >= 4
          s += 10 * (x[i - 4]^3 + x[i - 3]^3 + 1 - λ₃)^2
        end
      end
    end
    return s
  end

  x0 = zeros(T, n)
  for i = 1:n
    m = mod(i, 5)
    if m == 1
      x0[i] = i <= 2 ? T(-2) : T(-1)
    elseif m == 2
      x0[i] = i <= 2 ? T(2) : T(-1)
    elseif m == 3
      x0[i] = T(2)
    elseif m == 4
      x0[i] = T(-1)
    else
      x0[i] = T(-1)
    end
  end

  return ADNLPModels.ADNLPModel(f, x0, name = "auglag"; kwargs...)
end
