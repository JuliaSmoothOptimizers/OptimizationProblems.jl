function linsv(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = zeros(T, 2)
  f(x) = x[1]
  con(x) = T[x[1] + x[2]; x[2]]
  lcon = T[3; 1]
  ucon = T[Inf; Inf]

  return ADNLPModel(f, x0, con, lcon, ucon, name = "linsv_autodiff"; kwargs...)
end

linsv_meta = Dict(
  :nvar => 2,
  :variable_size => false,
  :ncon => 2,
  :variable_con_size => false,
  :nnzo => 2,
  :nnzh => 3,
  :nnzj => 4,
  :minimize => true,
  :name => "linsv",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :linear,
  :contype => :linear,
  :origin => :unknown,
  :deriv => typemax(UInt8),
  :not_everywhere_defined => false,
  :has_cvx_obj => false,
  :has_cvx_con => false,
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_linsv_meta(; n::Integer = default_nvar) = (linsv_meta[:nvar], linsv_meta[:ncon])
