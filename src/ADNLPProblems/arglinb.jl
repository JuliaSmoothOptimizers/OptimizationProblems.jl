export arglinb

function arglinb(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x; n = length(x))
    m = 2 * n
    sj = sum(j * x[j] for j = 1:n)
    return sum((i * sj - 1)^2 for i = 1:m)
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "arglinb"; kwargs...)
end
