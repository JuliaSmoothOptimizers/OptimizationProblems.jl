export toint

function toint(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    s = zero(T)
    for i = 1:n
      ci = 1 + (i // 10)

      for j = max(1, i - 2):min(n, i + 2)
        aij = 5 * (1 + mod(i, 5) + mod(j, 5))
        bij = (i + j) // 10
        cj = (1 + j) // 10
        s += aij * sin(bij + ci * x[i] + cj * x[j])
      end
    end
    return s / n
  end

  x0 = fill(one(T), n)
  return ADNLPModels.ADNLPModel(f, x0, name = "toint"; kwargs...)
end
