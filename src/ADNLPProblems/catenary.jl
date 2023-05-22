export catenary

function catenary(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  (n % 3 == 0) || @warn("catenary: number of variables adjusted to be a multiple of 3")
  n = 3 * max(1, div(n, 3))
  (n<9)|| @warn("catenary: number of variables adjusted to be greater or equal to 9")
  n = max(n,9)

  ## Model Parameters
  N = Int(n/3) - 1
  Bl = 1
  FRACT = 0.6
  d = (N+1)*FRACT

  function f(x;n=length(x))
    return sum(x[2+3*i] for i = 1:N)
  end

  function c!(cx, x;n=n) 
    cx[1] = x[1]
    cx[2] = x[2]
    cx[3] = x[3]
    cx[4] = x[n-2]
    cx[5] = x[n-1] - d
    cx[6] = x[n]
    for i in 7:(N+7)
        cx[i] = (x[1+3*i]-x[-2+3*i])^2 + (x[2+3*i]-x[-1+3*i])^2 + (x[3+3*i]-x[3*i])^2 - Bl^2
    end
    return cx
  end

  lcon = zeros(T,N+7)
  ucon = zeros(T,N+7)
  x0 = zeros(T,n)
  return ADNLPModels.ADNLPModel!(f, x0, c!, lcon, ucon, name = "catenary", ; kwargs...)
end
