export lanczos2

function lanczos2(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return lanczos2(Val(model); kwargs...)
end

function lanczos2(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
y = Rational{Int}[
  2.51340E+00  0.00000E+00
  2.04433E+00  5.00000E-02
  1.66840E+00  1.00000E-01
  1.36642E+00  1.50000E-01
  1.12323E+00  2.00000E-01
  9.26890E-01  2.50000E-01
  7.67934E-01  3.00000E-01
  6.38878E-01  3.50000E-01
  5.33784E-01  4.00000E-01
  4.47936E-01  4.50000E-01
  3.77585E-01  5.00000E-01
  3.19739E-01  5.50000E-01
  2.72013E-01  6.00000E-01
  2.32497E-01  6.50000E-01
  1.99659E-01  7.00000E-01
  1.72270E-01  7.50000E-01
  1.49341E-01  8.00000E-01
  1.30070E-01  8.50000E-01
  1.13812E-01  9.00000E-01
  1.00042E-01  9.50000E-01
  8.83321E-02  1.00000E+00
  7.83354E-02  1.05000E+00
  6.97669E-02  1.10000E+00
  6.23931E-02  1.15000E+00
]
  function f(x; y = y)
    return 1 // 2 * sum((y[i, 1] - (x[1]*exp(-x[2]* y[i, 2]) + x[3]*exp(-x[4]* y[i, 2]) + x[5]*exp(-x[6]*y[i, 2])))^2 for i = 1:24)
  end
  x0 = T[1.2, 0.3, 5.6, 5.5, 6.5, 7.6]
  return ADNLPModels.ADNLPModel(f, x0, name = "lanczos2"; kwargs...)
end

function lanczos2(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
y = Rational{Int}[
  2.51340E+00  0.00000E+00
  2.04433E+00  5.00000E-02
  1.66840E+00  1.00000E-01
  1.36642E+00  1.50000E-01
  1.12323E+00  2.00000E-01
  9.26890E-01  2.50000E-01
  7.67934E-01  3.00000E-01
  6.38878E-01  3.50000E-01
  5.33784E-01  4.00000E-01
  4.47936E-01  4.50000E-01
  3.77585E-01  5.00000E-01
  3.19739E-01  5.50000E-01
  2.72013E-01  6.00000E-01
  2.32497E-01  6.50000E-01
  1.99659E-01  7.00000E-01
  1.72270E-01  7.50000E-01
  1.49341E-01  8.00000E-01
  1.30070E-01  8.50000E-01
  1.13812E-01  9.00000E-01
  1.00042E-01  9.50000E-01
  8.83321E-02  1.00000E+00
  7.83354E-02  1.05000E+00
  6.97669E-02  1.10000E+00
  6.23931E-02  1.15000E+00
]
  function F!(r, x)
    m = 24
    for i = 1:m
      r[i] = y[i, 1] - (x[1]*exp(-x[2]* y[i, 2]) + x[3]*exp(-x[4]* y[i, 2]) + x[5]*exp(-x[6]*y[i, 2]))
    end
    return r
  end
  x0 = T[1.2, 0.3, 5.6, 5.5, 6.5, 7.6]
  return ADNLPModels.ADNLSModel!(F!, x0, 24, name = "lanczos2-nls"; kwargs...)
end
