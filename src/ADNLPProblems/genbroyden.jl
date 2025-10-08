export genbroyden

"""
Generalized Broyden tridiagonal problem (variable dimension).

This implementation follows the style of `broyden3d` but exposes a
parameter `alpha` to generalize the diagonal nonlinearity. It's provided
as both an ADNLPModel (objective) and an ADNLSModel (residual form).
"""
function genbroyden(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return genbroyden(Val(model); kwargs...)
end

function genbroyden(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, alpha::T = 2.0, kwargs...) where {T}
  function f(x; n = length(x))
    # Generalized form similar to Broyden tridiagonal: r_i = (3 - alpha*x_i)*x_i - x_{i-1} - 2*x_{i+1} + 1
    # Objective is 1/2 * sum r_i^2
    return one(T) // 2 * (
      ((3 - alpha * x[1]) * x[1] - 2 * x[2] + 1)^2 +
      sum(((3 - alpha * x[i]) * x[i] - x[i - 1] - 2 * x[i + 1] + 1)^2 for i = 2:(n - 1)) +
      ((3 - alpha * x[n]) * x[n] - x[n - 1] + 1)^2
    )
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "genbroyden"; kwargs...)
end

function genbroyden(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, alpha::T = 2.0, kwargs...) where {T}
  function F!(r, x; n = length(x))
    r[1] = (3 - alpha * x[1]) * x[1] - 2 * x[2] + 1
    r[n] = (3 - alpha * x[n]) * x[n] - x[n - 1] + 1
    for i = 2:(n - 1)
      r[i] = (3 - alpha * x[i]) * x[i] - x[i - 1] - 2 * x[i + 1] + 1
    end
    return r
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "genbroyden-nls"; kwargs...)
end
