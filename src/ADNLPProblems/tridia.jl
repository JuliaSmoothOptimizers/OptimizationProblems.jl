export tridia 
 
function tridia(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - 1)^2 + sum(i * (-x[i - 1] + 2 * x[i])^2 for i = 2:n)
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "tridia_autodiff"; kwargs...)
end

tridia_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "tridia",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => false,
  :objtype => :quadratic,
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

get_tridia_meta(; n::Integer = default_nvar) = (n, 0)
