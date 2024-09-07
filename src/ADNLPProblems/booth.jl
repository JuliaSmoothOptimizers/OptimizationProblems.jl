export booth

function booth(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return zero(eltype(x))
  end
  x0 = zeros(T, 2)

  A = T[
    1 2
    2 1
  ]
  function c!(cx, x)
    return cx
  end
  return ADNLPModels.ADNLPModel!(
    f,
    x0,
    findnz(sparse(A))...,
    c!,
    T[7, 5],
    T[7, 5],
    minimize = true,
    name = "booth";
    kwargs...,
  )
end
