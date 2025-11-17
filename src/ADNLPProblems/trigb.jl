export trigb

function trigb(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  # Band-limited trigonometric objective
  # F(x) = sum_{i=1}^n i * [ (1 - cos(x_i)) + sin(x_{i-1}) - sin(x_{i+1}) ]
  # with boundary values x_0 = x_{n+1} = 0

  function f(x; n = length(x))
    n_local = n
    s = zero(T)
    for i in 1:n_local
      xi = x[i]
      left = (i == 1) ? zero(T) : x[i - 1]
      right = (i == n_local) ? zero(T) : x[i + 1]
      term = T(i) * ( (one(T) - cos(xi)) + sin(left) - sin(right) )
      s += term
    end
    return s
  end

  # default initial guess: xbar_i = 1 (use type-generic one(T))
  x0 = fill(one(T), n)
  return ADNLPModels.ADNLPModel(f, x0, name = "trigb"; kwargs...)
end
