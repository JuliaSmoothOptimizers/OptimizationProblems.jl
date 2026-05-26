export brownden

function brownden(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return brownden(Val(model); kwargs...)
end

function brownden(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  nequ = max(n, 4)
  @adjust_nvar_warn("brownden", n_org, nequ)
  x0 = T[25.0; 5.0; -5.0; -1.0]
  t = [i // 5 for i = 1:nequ]
  function f(x)
    tt = one(eltype(x))
    return sum(
      (
        (x[1] + t[i] * x[2] - exp(tt * t[i]))^2 + (x[3] + x[4] * sin(tt * t[i]) - cos(tt * t[i]))^2
      )^2 for i = 1:nequ
    )
  end

  return ADNLPModels.ADNLPModel(f, x0, name = "brownden"; kwargs...)
end

function brownden(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  nequ = max(n, 4)
  @adjust_nvar_warn("brownden", n_org, nequ)
  x0 = T[25.0; 5.0; -5.0; -1.0]
  t = [i // 5 for i = 1:nequ]
  function F!(r, x, t = t)
    tt = one(eltype(x))
    for i = 1:length(r)
      r[i] =
        (x[1] + t[i] * x[2] - exp(tt * t[i]))^2 + (x[3] + x[4] * sin(tt * t[i]) - cos(tt * t[i]))^2
    end
    return r
  end

  return ADNLPModels.ADNLSModel!(F!, x0, nequ, name = "brownden-nls"; kwargs...)
end
