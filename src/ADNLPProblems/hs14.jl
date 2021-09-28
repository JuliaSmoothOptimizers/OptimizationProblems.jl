export hs14 
 
function hs14(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = T[2; 2]
  f(x) = (x[1] - 2)^2 + (x[2] - 1)^2
  c(x) = T[x[1] - 2 * x[2]; x[1]^2 / 4 + x[2]^2 - 1]
  lcon = T[-1; -Inf]
  ucon = T[-1; 0]

  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "hs14_autodiff"; kwargs...)
end

hs14_meta = Dict(
  :nvar => 2,
  :variable_size => false,
  :ncon => 2,
  :variable_con_size => false,
  :nnzo => 2,
  :nnzh => 3,
  :nnzj => 4,
  :minimize => true,
  :name => "hs14",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :quadratic,
  :contype => :quadratic,
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

get_hs14_meta(; n::Integer = default_nvar) = (hs14_meta[:nvar], hs14_meta[:ncon])
