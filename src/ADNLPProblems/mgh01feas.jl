export mgh01feas

function mgh01feas(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = T[-1.2; 1.0]
  f(x) = zero(eltype(x))
  c(x) = [10 * (x[2] - x[1]^2)]
  lcon = T[-1, 0]
  ucon = T[-1, 0]

  return ADNLPModels.ADNLPModel(
    f,
    x0,
    [1],
    [1],
    T[-1],
    c,
    lcon,
    ucon,
    name = "mgh01feas";
    kwargs...,
  )
end
