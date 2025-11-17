export toint

function toint(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    n_local = n
    s = zero(T)
    for i = 1:n_local
      xi = x[i]
      ci = 1 + (i / 10)

      jlo = max(1, i - 2)
      jhi = min(n_local, i + 2)
      for j = jlo:jhi
        aij = 5 * (1 + mod(i, 5) + mod(j, 5))
        bij = (i + j) / 10
        cj = (1 + j) / 10
        s += aij * sin(bij + ci * xi + cj * x[j])
      end

      if iseven(n_local)
        j = i + (n_local ÷ 2)
        if 1 <= j <= n_local
          aij = 5 * (1 + mod(i, 5) + mod(j, 5))
          bij = (i + j) / 10
          cj = (1 + j) / 10
          s += aij * sin(bij + ci * xi + cj * x[j])
        end
      end
    end
    return s / T(n_local)
  end

  x0 = fill(1, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "toint"; kwargs...)
end
