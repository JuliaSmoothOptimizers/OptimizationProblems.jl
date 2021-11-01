export eg2

function eg2(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    sum(sin(x[1] + x[i]^2 - 1) for i = 1:(n - 1)) + sin(x[n]^2) / 2
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "eg2_autodiff"; kwargs...)
end
