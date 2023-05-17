export mgh10

function mgh10(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return mgh10(Val(model); kwargs...)
end

function mgh10(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  y = Rational{Int}[
    3.478000E+04 5.000000E+01
    2.861000E+04 5.500000E+01
    2.365000E+04 6.000000E+01
    1.963000E+04 6.500000E+01
    1.637000E+04 7.000000E+01
    1.372000E+04 7.500000E+01
    1.154000E+04 8.000000E+01
    9.744000E+03 8.500000E+01
    8.261000E+03 9.000000E+01
    7.030000E+03 9.500000E+01
    6.005000E+03 1.000000E+02
    5.147000E+03 1.050000E+02
    4.427000E+03 1.100000E+02
    3.820000E+03 1.150000E+02
    3.307000E+03 1.200000E+02
    2.872000E+03 1.250000E+02
  ]
  function f(x; y = y)
    m = 16
    return 1 // 2 * sum((y[i, 1] - x[1] * exp(x[2] / (x[3] + y[i, 2])))^2 for i = 1:16)
  end
  x0 = T[2, 400000, 25000]
  return ADNLPModels.ADNLPModel(f, x0, name = "mgh10"; kwargs...)
end

function mgh10(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  y = Rational{Int}[
    3.478000E+04 5.000000E+01
    2.861000E+04 5.500000E+01
    2.365000E+04 6.000000E+01
    1.963000E+04 6.500000E+01
    1.637000E+04 7.000000E+01
    1.372000E+04 7.500000E+01
    1.154000E+04 8.000000E+01
    9.744000E+03 8.500000E+01
    8.261000E+03 9.000000E+01
    7.030000E+03 9.500000E+01
    6.005000E+03 1.000000E+02
    5.147000E+03 1.050000E+02
    4.427000E+03 1.100000E+02
    3.820000E+03 1.150000E+02
    3.307000E+03 1.200000E+02
    2.872000E+03 1.250000E+02
  ]
  function F!(r, x)
    m = 16
    for i = 1:m
      r[i] = y[i, 1] - x[1] * exp(x[2] / (x[3] + y[i, 2]))
    end
    return r
  end
  x0 = T[2, 400000, 25000]
  return ADNLPModels.ADNLSModel!(F!, x0, 16, name = "mgh10-nls"; kwargs...)
end
