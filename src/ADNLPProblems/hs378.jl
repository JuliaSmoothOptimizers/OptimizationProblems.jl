export hs378

function hs378(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  A = T[-6.089,-17.164,-34.054,-5.914,-24.721,-14.986,-24.1,-10.708,-26.662,-22.179]
  function f(x)
    return sum(exp(x[i])*(A[i]+x[i]-log(sum(exp(x[j]) for j = 1:10))) for i = 1:10)
  end
  function c!(cx,x)
    cx[1] = exp(x[1])+2*exp(x[2])+2*exp(x[3])+exp(x[6])+exp(x[10])-2
    cx[2] = exp(x[4])+2*exp(x[5])+exp(x[6])+exp(x[7])-1
    cx[3] = exp(x[3])+exp(x[7])+exp(x[8])+2*exp(x[9])+exp(x[10])-1
    return cx
  end
  x0 = T(-2.3)*ones(T,10)
  lcon = zeros(T,3)
  ucon = zeros(T,3)
  return ADNLPModels.ADNLPModel!(f, x0,c!,lcon,ucon, name = "hs378"; kwargs...)
end
