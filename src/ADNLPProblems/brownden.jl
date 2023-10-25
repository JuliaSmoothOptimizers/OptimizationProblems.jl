export brownden

function brownden(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return brownden(Val(model); kwargs...)
end

function brownden(
  ::Val{:nlp};
  m::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  m < 4 && @warn("brownden: must have m ≥ 4")
  m = max(m, 4)
  x0 = T[25.0; 5.0; -5.0; -1.0]
  t = [i // 5 for i = 1:m]
  function f(x; m = m, t = t)
    tt = one(eltype(x))
    return sum(
      (
        (x[1] + t[i] * x[2] - exp(tt * t[i]))^2 + (x[3] + x[4] * sin(tt * t[i]) - cos(tt * t[i]))^2
      )^2 for i = 1:m
    )
  end

  return ADNLPModels.ADNLPModel(f, x0, name = "brownden"; kwargs...)
end

function brownden(
  ::Val{:nls};
  m::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  m < 4 && @warn("brownden: must have m ≥ 4")
  m = max(m, 4)
  x0 = T[25.0; 5.0; -5.0; -1.0]
  t = [i // 5 for i = 1:m]
  function F!(r, x; m = m, t = t)
    tt = one(eltype(x))
    for i = 1:m
      r[i] =
        (x[1] + t[i] * x[2] - exp(tt * t[i]))^2 + (x[3] + x[4] * sin(tt * t[i]) - cos(tt * t[i]))^2
    end
    return r
  end

  return ADNLPModels.ADNLSModel!(F!, x0, m, name = "brownden-nls"; kwargs...)
end
