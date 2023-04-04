export hovercraft1d

function hovercraft1d(
  args...;
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  N = div(n, 3)
  function f(y; N = N)
    @views x, v, u = y[1:N], y[(N + 1):(2 * N)], y[(2 * N + 1):end]
    return 1 // 2 * sum(u .^ 2)
  end
  xi = zeros(T, 3 * N - 1)
  clinrows = vcat(
    [1],
    [2],
    [3],
    [4],
    [4 + i for i = 1:(N - 1)], # x[i + 1] - x[i] - v[i]
    [4 + i for i = 1:(N - 1)],
    [4 + i for i = 1:(N - 1)],
    [4 + N - 1 + i for i = 1:(N - 1)], # [v[i + 1] - v[i] - u[i] for i = 1:(N - 1)]
    [4 + N - 1 + i for i = 1:(N - 1)],
    [4 + N - 1 + i for i = 1:(N - 1)],
  )
  clincols = vcat(
    [1],
    [N + 1],
    [N],
    [2 * N],
    [i + 1 for i = 1:(N - 1)], # x[i + 1]
    [i for i = 1:(N - 1)], # x[i]
    [N + i for i = 1:(N - 1)], # v[i]
    [N + i + 1 for i = 1:(N - 1)], # v[i + 1]
    [N + i for i = 1:(N - 1)], # v[i]
    [2 * N + i for i = 1:(N - 1)], # u[i]
  )
  clinvals = vcat(
    T[1],
    T[1],
    T[1],
    T[1],
    T[1 for i = 1:(N - 1)],
    T[-1 for i = 1:(N - 1)],
    T[-1 for i = 1:(N - 1)],
    T[1 for i = 1:(N - 1)],
    T[-1 for i = 1:(N - 1)],
    T[-1 for i = 1:(N - 1)],
  )
  return ADNLPModels.ADNLPModel(
    f,
    xi,
    clinrows,
    clincols,
    clinvals,
    vcat(zeros(T, 2), T(100), zeros(T, 2 * N - 1)),
    vcat(zeros(T, 2), T(100), zeros(T, 2 * N - 1)),
    name = "hovercraft1d";
    kwargs...,
  )
end
