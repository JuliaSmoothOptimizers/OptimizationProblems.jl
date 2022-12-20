export arglina

function arglina(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x; n = length(x))
    m = 2 * n
    return sum((x[i] - 2 // m * sum(x[j] for j = 1:n) - 1)^2 for i = 1:n) +
           sum((-2 // m * sum(x[j] for j = 1:n) - 1)^2 for i = (n + 1):m)
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "arglina"; kwargs...)
end
