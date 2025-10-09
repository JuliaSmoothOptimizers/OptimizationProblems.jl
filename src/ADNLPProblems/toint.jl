export toint

function toint(; n::Int = default_nvar, kwargs...)
  return toint(Val(:nlp); n = n, kwargs...)
end

function toint(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    return sum((cos(x[i]) - x[i]^2)^2 for i = 1:n)
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "toint", minimize = true, kwargs...)
end
