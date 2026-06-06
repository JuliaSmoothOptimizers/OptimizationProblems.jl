export browngen2

function browngen2(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  n = max(2, n)
  @adjust_nvar_warn("browngen2", n_org, n)
  function f(x; n = length(x))
    s = zero(T)
    @inbounds for i = 2:n
      s += (x[i - 1]^2)^(x[i]^2 + 1) + (x[i]^2)^(x[i - 1]^2 + 1)
    end
    return s
  end
  x0 = [isodd(i) ? -one(T) : one(T) for i = 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "browngen2"; kwargs...)
end
