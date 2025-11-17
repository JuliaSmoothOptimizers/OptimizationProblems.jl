export trigb

function trigb(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    n_local = n
    s = zero(T)
    for i = 1:n_local
      xi = x[i]
      left = (i == 1) ? zero(T) : x[i - 1]
      right = (i == n_local) ? zero(T) : x[i + 1]
      term = i * (1 - cos(xi) + sin(left) - sin(right))
      s += term
    end
    return s
  end

  x0 = fill(1, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "trigb"; kwargs...)
end
