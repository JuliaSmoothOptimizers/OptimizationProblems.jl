export browngen

function browngen(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n = max(2, n)
  function f(x; n = length(x))
    s = zero(T)
    @inbounds for i in 2:n
      s += (x[i - 1] - T(3))^2 +
           (x[i - 1] - x[i])^2 +
           exp(T(20) * (x[i - 1] - x[i]))
    end
    return s
  end
  x0 = [isodd(i) ? zero(T) : -one(T) for i in 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "browngen"; kwargs...)
end
