export nazareth

function nazareth(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return nazareth(Val(model); kwargs...)
end

function nazareth(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    s = zero(T)
    for i = 1:n
      Ji = [j for j in max(1, i-2):min(n, i+2)]
      nh = div(n, 2)
      for j in (1:n)
        if abs(j-i) == nh && !(j in Ji)
          push!(Ji, j)
        end
      end
      sumtrig = zero(T)
      for j in Ji
        aij = T(5 * (1 + mod(i,5) + mod(j,5)))
        bij = T((i + j) / 10)
        sumtrig += aij * sin(x[j]) + bij * cos(x[j])
      end
      s += (n + i - sumtrig)^2
    end
    return s
  end
  x0 = fill(one(T)/T(n), n)
  return ADNLPModels.ADNLPModel(f, x0, name = "nazareth", minimize = true; kwargs...)
end

function nazareth(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  x0 = fill(one(T)/T(n), n)
  function F!(r, x)
    nh = div(n, 2)
    @inbounds for i = 1:n
      sumtrig = zero(T)
      for j = max(1, i-2):min(n, i+2)
        aij = T(5 * (1 + mod(i,5) + mod(j,5)))
        bij = T((i + j) / 10)
        sumtrig += aij * sin(x[j]) + bij * cos(x[j])
      end
      for j = 1:n
        if abs(j-i) == nh && (j < max(1, i-2) || j > min(n, i+2))
          aij = T(5 * (1 + mod(i,5) + mod(j,5)))
          bij = T((i + j) / 10)
          sumtrig += aij * sin(x[j]) + bij * cos(x[j])
        end
      end
      r[i] = n + i - sumtrig
    end
    return r
  end
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "nazareth"; kwargs...)
end

