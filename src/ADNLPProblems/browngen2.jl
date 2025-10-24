export browngen2

function browngen2(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n = max(2, n)
  function f(x; n = length(x))
    s = zero(T)
    @inbounds for i = 2:n
      s += abs(x[i-1])^(x[i]^2 + one(T)) + abs(x[i])^(x[i-1]^2 + one(T))
    end
    return s
  end
  x0 = [isodd(i) ? -one(T) : one(T) for i in 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "browngen2"; kwargs...)
end
