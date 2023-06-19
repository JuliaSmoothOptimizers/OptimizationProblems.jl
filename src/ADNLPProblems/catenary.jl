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
  function f(x; N = N)
    return sum(x[2+3*i] for i = 1:N)
  end

  function c!(cx, x) 
    for i in 1:N
        cx[i] = (x[1+3*i]-x[-2+3*i])^2 + (x[2+3*i]-x[-1+3*i])^2 + (x[3+3*i]-x[3*i])^2 - Bl^2
    end
    return cx
  end

  lvar = T(-Inf)*ones(T,n)
  uvar = T(Inf)*ones(T,n)
  lvar[1:3] .= T(0)
  uvar[1:3] .= T(0)
  lvar[n-1:n] .= T(0)
  uvar[n-1:n] .= T(0)
  lvar[n-2] = T(d)
  uvar[n-2]  = T(d)

  lcon = zeros(T,N)
  ucon = zeros(T,N)
  x0 = zeros(T,n)
  return ADNLPModels.ADNLPModel!(f, x0,lvar,uvar, c!, lcon, ucon, name = "catenary" ; kwargs...)
end
