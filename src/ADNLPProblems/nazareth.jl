export nazareth

function nazareth(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function F!(r, x; n = length(x))
    # Placeholder residuals for Problem 8
    for i = 1:n
      r[i] = sin(x[i]) - 0.1
    end
    return r
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "nazareth"; kwargs...)
end
