export hovercraft1d

function hovercraft1d(
  args...;
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  N = div(n, 3)
  function f(y)
    x, v, u = y[1:N], y[(N + 1):(2 * N)], y[(2 * N + 1):end]
    return sum(u .^ 2)
  end
  function c(y)
    x, v, u = y[1:N], y[(N + 1):(2 * N)], y[(2 * N + 1):end]
    return vcat(
      x[1],
      v[1],
      x[N] - 100,
      v[N],
      [x[i + 1] - x[i] - v[i] for i = 1:(N - 1)],
      [v[i + 1] - v[i] - u[i] for i = 1:(N - 1)],
    )
  end
  xi = zeros(T, 3 * N - 1)
  return ADNLPModels.ADNLPModel(
    f,
    xi,
    c,
    zeros(T, 2 * N + 2),
    zeros(T, 2 * N + 2),
    name = "hovercraft1d";
    lin = collect(1:(2 * N + 2)),
    kwargs...,
  )
end
