export beale

function beale(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return beale(Val(model); kwargs...)
end

function beale(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    return 1 // 2 * (15 // 10 - x[1] * (1 - x[2]))^2 +
           1 // 2 * (225 // 100 - x[1] * (1 - x[2]^2))^2 +
           1 // 2 * (2625 // 1000 - x[1] * (1 - x[2]^3))^2
  end
  x0 = ones(T, 2)
  return ADNLPModels.ADNLPModel(f, x0, name = "beale"; kwargs...)
end

function beale(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function F!(r, x)
    r[1] = 15 // 10 - x[1] * (1 - x[2])
    r[2] = 225 // 100 - x[1] * (1 - x[2]^2)
    r[3] = 2625 // 1000 - x[1] * (1 - x[2]^3)
    return r
  end
  x0 = ones(T, 2)
  return ADNLPModels.ADNLSModel!(F!, x0, 3, name = "beale-nls"; kwargs...)
end
