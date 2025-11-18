export trigb

function trigb(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    s = zero(T)
    for i = 1:n
      xim = (i == 1) ? zero(T) : x[i - 1]
      xip = (i == n) ? zero(T) : x[i + 1]
      s += i * (1 - cos(x[i]) + sin(xim) - sin(xip))
    end
    return s
  end

  x0 = fill(one(T), n)
  return ADNLPModels.ADNLPModel(f, x0, name = "trigb"; kwargs...)
end
