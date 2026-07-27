export chnrosnb_mod

function chnrosnb_mod(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  n = max(2, n)
  @adjust_nvar_warn("chnrosnb_mod", n_org, n)
  function f(x; n = length(x))
    return 16 * sum((x[i - 1] - x[i]^2)^2 * (15 // 10 + sin(eltype(x)(i)))^2 for i = 2:n) +
           sum((1 - x[i])^2 for i = 2:n)
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "chnrosnb_mod"; kwargs...)
end
