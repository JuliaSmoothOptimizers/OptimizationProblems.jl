export power

function power(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x; n = length(x))
    return 1 // 2 * (sum((i * x[i]^2) for i = 1:n))^2
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "power"; kwargs...)
end
