export tquartic 
 
function tquartic(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("tquartic : n ≥ 2")
  function f(x)
    n = length(x)
    return (x[1] - 1)^2 + sum((x[1]^2 - x[i + 1]^2)^2 for i = 1:(n - 2))
  end
  x0 = T(0.1) * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "tquartic_autodiff"; kwargs...)
end

tquartic_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "tquartic",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => false,
  :objtype => :sum_of_squares,
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

get_tquartic_meta(; n::Integer = default_nvar) = (n, 0)
