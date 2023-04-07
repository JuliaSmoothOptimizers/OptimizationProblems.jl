export hs52

function hs52(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return hs52(Val(model); kwargs...)
end

function hs52(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x ->
      1 // 2 * (4 * x[1] - x[2])^2 +
      1 // 2 * (x[2] + x[3] - 2)^2 +
      1 // 2 * (x[4] - 1)^2 +
      1 // 2 * (x[5] - 1)^2,
    2 * ones(T, 5),
    [1; 1; 2; 2; 2; 3; 3],
    [1; 2; 3; 4; 5; 2; 5],
    T[1; 3; 1; 1; -2; 1; -1],
    zeros(T, 3),
    zeros(T, 3),
    name = "hs52";
    kwargs...,
  )
end

function hs52(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function F!(r, x)
    r[1] = 4 * x[1] - x[2]
    r[2] = x[2] + x[3] - 2
    r[3] = x[4] - 1
    r[4] = x[5] - 1
    return r
  end
  return ADNLPModels.ADNLSModel!(
    F!,
    2 * ones(T, 5),
    4,
    [1; 1; 2; 2; 2; 3; 3],
    [1; 2; 3; 4; 5; 2; 5],
    T[1; 3; 1; 1; -2; 1; -1],
    zeros(T, 3),
    zeros(T, 3),
    name = "hs52-nls";
    kwargs...,
  )
end
