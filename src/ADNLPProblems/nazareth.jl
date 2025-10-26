export nazareth

function nazareth(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return nazareth(Val(model); kwargs...)
end

function nazareth(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  nh = div(n, 2)
  neighbors = Vector{Vector{Int}}(undef, n)
  a_row = Vector{Vector{T}}(undef, n)
  b_row = Vector{Vector{T}}(undef, n)
  for i in 1:n
    lo = max(1, i - 2)
    hi = min(n, i + 2)
    neigh = collect(lo:hi)
    j1 = i - nh
    j2 = i + nh
    for j in (j1, j2)
      if 1 <= j <= n && !(j >= lo && j <= hi)
        push!(neigh, j)
      end
    end
    neighbors[i] = neigh
    a_row[i] = [5 * (1 + mod(i,5) + mod(j,5)) for j in neigh]
    b_row[i] = [(i + j) / 10 for j in neigh]
  end

  function f(x; n = length(x))
    s = zero(T)
    for i in 1:n
      sumtrig = zero(T)
      neigh = neighbors[i]
      ai = a_row[i]
      bi = b_row[i]
      @inbounds for k in 1:length(neigh)
        j = neigh[k]
        sumtrig += ai[k] * sin(x[j]) + bi[k] * cos(x[j])
      end
      s += (n + i - sumtrig)^2
    end
    return s / n
  end
  x0 = fill(one(T) / n, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "nazareth", minimize = true; kwargs...)
end

function nazareth(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  nh = div(n, 2)
  neighbors = Vector{Vector{Int}}(undef, n)
  a_row = Vector{Vector{T}}(undef, n)
  b_row = Vector{Vector{T}}(undef, n)
  for i in 1:n
    lo = max(1, i - 2)
    hi = min(n, i + 2)
    neigh = collect(lo:hi)
    j1 = i - nh
    j2 = i + nh
    for j in (j1, j2)
      if 1 <= j <= n && !(j >= lo && j <= hi)
        push!(neigh, j)
      end
    end
    neighbors[i] = neigh
    a_row[i] = [5 * (1 + mod(i,5) + mod(j,5)) for j in neigh]
    b_row[i] = [(i + j) / 10 for j in neigh]
  end

  x0 = fill(one(T) / n, n)
  function F!(r, x)
    @inbounds for i in 1:n
      sumtrig = zero(T)
      neigh = neighbors[i]
      ai = a_row[i]
      bi = b_row[i]
      for k in 1:length(neigh)
        j = neigh[k]
        sumtrig += ai[k] * sin(x[j]) + bi[k] * cos(x[j])
      end
      r[i] = (n + i - sumtrig) / sqrt(T(n))
    end
    return r
  end
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "nazareth"; kwargs...)
end

