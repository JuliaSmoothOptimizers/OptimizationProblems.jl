function indef_mod(;
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  n ≥ 3 || error("indef : n ≥ 3")
  function f(x)
    n = length(x)
    return 100 * sum(sin(x[i] / 100) for i = 1:n) +
           T(0.5) * sum(cos(2 * x[i] - x[n] - x[1]) for i = 2:(n - 1))
  end
  x0 = T.([(i / (n + 1)) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "indef_autodiff"; kwargs...)
end

indef_mod_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "indef_mod",
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

get_indef_mod_meta(; n::Integer = default_nvar) = (n, 0)
