export variational

function variational(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return variational(Val(model); kwargs...)
end

function variational(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  h = 1 // (n + 1)

  function f(x; n = length(x))
    S = eltype(x)
    hS = convert(S, h)

    xext = Vector{S}(undef, n + 2)
    xext[1] = zero(S)
    @inbounds for i = 1:n
      xext[i + 1] = x[i]
    end
    xext[n + 2] = zero(S)

    term1 = zero(S)
    @inbounds for i = 1:n
      xi = x[i]
      xip1 = xext[i + 2]
      term1 += xi * (xi - xip1) / hS
    end

    diffquot(a, b) = (b - a == zero(b - a)) ? exp(a) : (exp(b) - exp(a)) / (b - a)

    term2 = zero(S)
    @inbounds for j = 0:n
      a = xext[j + 1]
      b = xext[j + 2]
      term2 += diffquot(a, b)
    end
    return 2 * (term1 + n * (hS / 2) * term2)
  end

  x0 = Vector{T}(undef, n)
  for i = 1:n
    x0[i] = i * h * (one(T) - i * h)
  end

  return ADNLPModels.ADNLPModel(f, x0, name = "variational", minimize = true; kwargs...)
end

function variational(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  h = 1 // (n + 1)

  diffquot(a, b) = (b - a == zero(b - a)) ? exp(a) : (exp(b) - exp(a)) / (b - a)

  function F!(r, x)
    S = eltype(x)
    hS = convert(S, h)

    xext = Vector{S}(undef, n + 2)
    xext[1] = zero(S)
    @inbounds for i = 1:n
      xext[i + 1] = x[i]
    end
    xext[n + 2] = zero(S)

    term1 = zero(S)
    @inbounds for i = 1:n
      xi = x[i]
      xip1 = xext[i + 2]
      term1 += xi * (xi - xip1) / hS
    end

    term2 = zero(S)
    @inbounds for j = 0:n
      a = xext[j + 1]
      b = xext[j + 2]
      term2 += diffquot(a, b)
    end

    Fval = 2 * (term1 + n * (hS / 2) * term2)
    r[1] = sqrt(Fval < zero(Fval) ? zero(Fval) : Fval)
    return r
  end

  x0 = Vector{T}(undef, n)
  for i = 1:n
    x0[i] = i * h * (1 - i * h)
  end

  return ADNLPModels.ADNLSModel!(F!, x0, 1, name = "variational-nls"; kwargs...)
end
