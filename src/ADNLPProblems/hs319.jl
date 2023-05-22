export hs319

function hs319(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x;n = length(x))
    return (x[1]-20)^2 + (x[2]+20)^2
  end
  function c!(cx,x)
    cx[1] = x[1]^2/100+x[2]^2/16-1
  end
  x0 = zeros(T,2)
  lcon = zero(T)
  ucon = zero(T)
  return ADNLPModels.ADNLPModel(f, x0,c!,lcon,ucon name = "hs319"; kwargs...)
end