export hs11 
 
function hs11(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = T[4.9; 0.1]
  f(x) = (x[1] - 5)^2 + x[2]^2 - 25
  c(x) = T[x[1]^2 - x[2]]
  lcon = -T[Inf]
  ucon = T[0.0]

  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "hs11_autodiff"; kwargs...)
end

hs11_meta = Dict(
  :nvar => 2,
  :variable_size => false,
  :ncon => 1,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs11",
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
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_hs11_meta(; n::Integer = default_nvar) = (hs11_meta[:nvar], hs11_meta[:ncon])
