export hs51

function hs51(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs51(Val(model); kwargs...)
end

function hs51(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x ->
      1 // 2 * (x[1] - x[2])^2 +
      1 // 2 * (x[2] + x[3] - 2)^2 +
      1 // 2 * (x[4] - 1)^2 +
      1 // 2 * (x[5] - 1)^2,
    T[2.5, 0.5, 2.0, -1.0, 0.5],
    [1; 1; 2; 2; 2; 3; 3],
    [1; 2; 3; 4; 5; 2; 5],
    T[1; 3; 1; 1; -2; 1; -1],
    T[4, 0, 0],
    T[4, 0, 0],
    name = "hs51";
    kwargs...,
  )
end

function hs51(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function F!(r, x)
    r[1] = x[1] - x[2]
    r[2] = x[2] + x[3] - 2
    r[3] = x[4] - 1
    r[4] = x[5] - 1
    return r
  end
  return ADNLPModels.ADNLSModel!(
    F!,
    T[2.5, 0.5, 2.0, -1.0, 0.5],
    4,
    [1; 1; 2; 2; 2; 3; 3],
    [1; 2; 3; 4; 5; 2; 5],
    T[1; 3; 1; 1; -2; 1; -1],
    T[4, 0, 0],
    T[4, 0, 0],
    name = "hs51-nls";
    kwargs...,
  )
end
