export boundary

function boundary(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return boundary(Val(model); kwargs...)
end

function boundary(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  h = 1 // n + 1
  function f(x; n = length(x))
    s = zero(T)
    for i = 1:n
      xm = (i == 1) ? zero(T) : x[i - 1]
      xp = (i == n) ? zero(T) : x[i + 1]
      s += (2 * x[i] - xm - xp + (h^2 / 2) * (x[i] + i * h + 1)^3)^2
    end
    return s
  end

  x0 = Vector{T}(undef, n)
  for i = 1:n
    x0[i] = i * h * (1 - i * h)
  end

  return ADNLPModels.ADNLPModel(f, x0, name = "boundary", minimize = true; kwargs...)
end

function boundary(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  h = 1 // n + 1

  function F!(r, x)
    @inbounds for i = 1:length(x)
      xm = (i == 1) ? zero(T) : x[i - 1]
      xp = (i == length(x)) ? zero(T) : x[i + 1]
      r[i] = 2 * x[i] - xm - xp + (h^2 / 2) * (x[i] + i * h + 1)^3
    end
    return r
  end

  x0 = Vector{T}(undef, n)
  for i = 1:n
    x0[i] = i * h * (1 - i * h)
  end

  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "boundary-nls"; kwargs...)
end
