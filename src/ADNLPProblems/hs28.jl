export hs28

function hs28(;use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs28(Val(model); kwargs...)
end

function hs28(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> 1 // 2 * (x[1] + x[2])^2 + 1 // 2 * (x[2] + x[3])^2,
    T[-4.0, 1.0, 1.0],
    [1; 1; 1],
    [1; 2; 3],
    T[1; 2; 3],
    ones(T, 1),
    ones(T, 1),
    name = "hs28";
    kwargs...,
  )
end

function hs28(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function F!(r, x)
    r[1] = x[1] + x[2]
    r[2] = x[2] + x[3]
    return r
  end
  return ADNLPModels.ADNLSModel!(
    F!,
    T[-4.0, 1.0, 1.0],
    2,
    [1; 1; 1],
    [1; 2; 3],
    T[1; 2; 3],
    ones(T, 1),
    ones(T, 1),
    name = "hs28-nls";
    kwargs...,
  )
end
