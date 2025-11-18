export trig

function trig(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    s = zero(T)
    for i = 1:n_local
      term = i * (1 - cos(xi))

      for j = max(1, i - 2):min(n, i + 2)
        aij = 5 * (1 + mod(i, 5) + mod(j, 5))
        bij = (i + j) / 10
        term += aij * sin(x[j]) + bij * cos(x[j])
      end

      if iseven(n_local)
        j = i + (n_local ÷ 2)
        if 1 <= j <= n_local
          aij = 5 * (1 + mod(i, 5) + mod(j, 5))
          bij = (i + j) / 10
          term += aij * sin(x[j]) + bij * cos(x[j])
        end
      end

      s += term
    end
    return s / n
  end

  x0 = fill(one(T) / n, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "trig"; kwargs...)
end
