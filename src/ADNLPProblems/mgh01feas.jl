function mgh01feas(;
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  x0 = T[-1.2; 1.0]
  f(x) = zero(T)
  c(x) = T[1 - x[1]; 10 * (x[2] - x[1]^2)]
  lcon = zeros(T, 2)
  ucon = zeros(T, 2)

  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "mgh01feas_autodiff"; kwargs...)
end

mgh01feas_meta = Dict(
  :nvar => 2,
  :variable_size => false,
  :ncon => 2,
  :variable_con_size => false,
  :nnzo => 2,
  :nnzh => 3,
  :nnzj => 4,
  :minimize => true,
  :name => "mgh01feas",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :constant,
  :contype => :quadratic,
  :origin => :unknown,
  :deriv => typemax(UInt8),
  :not_everywhere_defined => false,
  :has_cvx_obj => false,
  :has_cvx_con => false,
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_mgh01feas_meta(; n::Integer = default_nvar) = (mgh01feas_meta[:nvar], mgh01feas_meta[:ncon])
