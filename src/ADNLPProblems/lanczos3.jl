export lanczos3

function lanczos3(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return lanczos3(Val(model); kwargs...)
end

function lanczos3(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    2.5134E+00 0.00000E+00
    2.0443E+00 5.00000E-02
    1.6684E+00 1.00000E-01
    1.3664E+00 1.50000E-01
    1.1232E+00 2.00000E-01
    0.9269E+00 2.50000E-01
    0.7679E+00 3.00000E-01
    0.6389E+00 3.50000E-01
    0.5338E+00 4.00000E-01
    0.4479E+00 4.50000E-01
    0.3776E+00 5.00000E-01
    0.3197E+00 5.50000E-01
    0.2720E+00 6.00000E-01
    0.2325E+00 6.50000E-01
    0.1997E+00 7.00000E-01
    0.1723E+00 7.50000E-01
    0.1493E+00 8.00000E-01
    0.1301E+00 8.50000E-01
    0.1138E+00 9.00000E-01
    0.1000E+00 9.50000E-01
    0.0883E+00 1.00000E+00
    0.0783E+00 1.05000E+00
    0.0698E+00 1.10000E+00
    0.0624E+00 1.15000E+00
  ]
  function f(x; y = y)
    m = 24
    return 1 // 2 * sum(
      (
        y[i, 1] -
        (x[1] * exp(-x[2] * y[i, 2]) + x[3] * exp(-x[4] * y[i, 2]) + x[5] * exp(-x[6] * y[i, 2]))
      )^2 for i = 1:24
    )
  end
  x0 = T[1.2, 0.3, 5.6, 5.5, 6.5, 7.6]
  return ADNLPModels.ADNLPModel(f, x0, name = "lanczos3"; kwargs...)
end

function lanczos3(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    2.5134E+00 0.00000E+00
    2.0443E+00 5.00000E-02
    1.6684E+00 1.00000E-01
    1.3664E+00 1.50000E-01
    1.1232E+00 2.00000E-01
    0.9269E+00 2.50000E-01
    0.7679E+00 3.00000E-01
    0.6389E+00 3.50000E-01
    0.5338E+00 4.00000E-01
    0.4479E+00 4.50000E-01
    0.3776E+00 5.00000E-01
    0.3197E+00 5.50000E-01
    0.2720E+00 6.00000E-01
    0.2325E+00 6.50000E-01
    0.1997E+00 7.00000E-01
    0.1723E+00 7.50000E-01
    0.1493E+00 8.00000E-01
    0.1301E+00 8.50000E-01
    0.1138E+00 9.00000E-01
    0.1000E+00 9.50000E-01
    0.0883E+00 1.00000E+00
    0.0783E+00 1.05000E+00
    0.0698E+00 1.10000E+00
    0.0624E+00 1.15000E+00
  ]
  function F!(r, x)
    m = 24
    for i = 1:m
      r[i] =
        y[i, 1] -
        (x[1] * exp(-x[2] * y[i, 2]) + x[3] * exp(-x[4] * y[i, 2]) + x[5] * exp(-x[6] * y[i, 2]))
    end
    return r
  end
  x0 = T[1.2, 0.3, 5.6, 5.5, 6.5, 7.6]
  return ADNLPModels.ADNLSModel!(F!, x0, 24, name = "lanczos3-nls"; kwargs...)
end
