export polygon3

function polygon3(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  N = div(n, 2)
  function f(y; N = N)
    @views x, y = y[1:N], y[(N + 1):end]
    return -1 // 2 * sum(x[i] * y[i + 1] - y[i] * x[i + 1] for i = 1:(N - 1)) -
           1 // 2 * (x[N] * y[1] - y[N] * x[1])
  end
  function c!(cx, y; N = N)
    @views x, y = y[1:N], y[(N + 1):end]
    for i=1:N
      cx[i] = x[i]^2 + y[i]^2 - 1
    end
    for i = 1:(N - 1)
      cx[N + i] = x[i] * y[i + 1] - y[i] * x[i + 1]
    end
    cx[2 * N] = x[N] * y[1] - y[N] * x[1]
    return cx
  end
  xi = zeros(T, 2 * N)
  return ADNLPModels.ADNLPModel!(
    f,
    xi,
    c!,
    vcat(-T(Inf) * ones(T, N), zeros(T, N)),
    vcat(zeros(T, N), T(Inf) * ones(T, N)),
    name = "polygon3";
    kwargs...,
  )
end
