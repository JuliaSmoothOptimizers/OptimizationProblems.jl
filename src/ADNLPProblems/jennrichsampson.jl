export jennrichsampson

function jennrichsampson(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return jennrichsampson(Val(model); kwargs...)
end

function jennrichsampson(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  m::Int = 10,
  kwargs...,
) where {T}
  x0 = T[0.3; 0.4]
  f(x) = 1 // 2 * sum((2 + 2 * i - (exp(i * x[1]) + exp(i * x[2])))^2 for i = 1:m)

  return ADNLPModels.ADNLPModel(f, x0, name = "jennrichsampson"; kwargs...)
end

function jennrichsampson(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  m::Int = 10,
  kwargs...,
) where {T}
  x0 = T[0.3; 0.4]
  function F!(r, x; m = m)
    for i = 1:m
      r[i] = 2 + 2 * i - (exp(i * x[1]) + exp(i * x[2]))
    end
    return r
  end
  return ADNLPModels.ADNLSModel!(F!, x0, m, name = "jennrichsampson-nls"; kwargs...)
end
