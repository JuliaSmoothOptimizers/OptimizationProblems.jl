export scosine 
 
function scosine(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("scosine : n ≥ 2")
  p = zeros(T, n)
  for i = 1:n
    p[i] = exp(6 * (i - 1) / (n - 1))
  end
  function f(x)
    n = length(x)
    return sum(cos(p[i]^2 * x[i]^2 - p[i + 1] * x[i + 1] / 2) for i = 1:(n - 1))
  end
  x0 = T.([1 / p[i] for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "scosine_autodiff"; kwargs...)
end

scosine_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "scosine",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => false,
  :objtype => :other,
  :contype => :unconstrained,
  :origin => :unknown,
  :deriv => typemax(UInt8),
  :not_everywhere_defined => false,
  :has_cvx_obj => false,
  :has_cvx_con => false,
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_scosine_meta(; n::Integer = default_nvar) = (n, 0)
