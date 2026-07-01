export sinquad

function sinquad(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  n = max(3, n)
  @adjust_nvar_warn("sinquad", n_org, n)
  function f(x; n = length(x))
    return (x[1] - 1)^4 +
           (x[n]^2 - x[1]^2)^2 +
           sum((sin(x[i] - x[n]) - x[1]^2 + x[i]^2)^2 for i = 2:(n - 1))
  end
  x0 = ones(T, n) / 10
  return ADNLPModels.ADNLPModel(f, x0, name = "sinquad"; kwargs...)
end
