export trig

function trig(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    s = zero(T)
    for i = 1:n
      s += i * (1 - cos(x[i]))

      js = max(1, i - 2):min(n, i + 2)
      if iseven(n)
        js = sort(collect(union(collect(js), [j for j in (i + n ÷ 2, i - n ÷ 2) if 1 <= j <= n])))
      end
      for j in js
        aij = 5 * (1 + mod(i, 5) + mod(j, 5))
        bij = (i + j) // 10
        s += aij * sin(x[j]) + bij * cos(x[j])
      end
    end
    return s / n
  end

  x0 = fill(one(T) / n, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "trig"; kwargs...)
end
