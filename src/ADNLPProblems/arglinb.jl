export arglinb

function arglinb(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    m = 2 * n
    return sum((i * sum(j * x[j] for j = 1:n) - 1)^2 for i = 1:m)
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "arglinb_autodiff"; kwargs...)
end
