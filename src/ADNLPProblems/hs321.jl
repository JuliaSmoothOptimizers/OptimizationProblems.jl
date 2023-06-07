export hs321

function hs321(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    return (x[1]-20)^2 + (x[2]+20)^2
  end
  function c!(cx,x)
    cx[1] = x[1]^2/100+x[2]^2/1-1
    return cx
  end
  x0 = zeros(T,2)
  lcon = zeros(T,1)
  ucon = zeros(T,1)
  return ADNLPModels.ADNLPModel!(f, x0,c!,lcon,ucon, name = "hs321"; kwargs...)
end