export arglinc

function arglinc(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    m = 2 * n
    sj = sum(j * x[j] for j = 2:(n - 1))
    return 2 + sum(((i - 1) * sj - 1)^2 for i = 2:(m - 1))
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "arglinc"; kwargs...)
end
