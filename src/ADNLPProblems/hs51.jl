export hs51 
 
function hs51(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - x[2])^2 + (x[2] + x[3] - 2)^2 + (x[4] - 1)^2 + (x[5] - 1)^2,
    T[2.5, 0.5, 2.0, -1.0, 0.5],
    x -> [x[1] + 3 * x[2] - 4; x[3] + x[4] - 2 * x[5]; x[2] - x[5]],
    zeros(T, 3),
    zeros(T, 3),
    name = "hs51_autodiff";
    kwargs...,
  )
end

hs51_meta = Dict(
  :nvar => 5,
  :variable_size => false,
  :ncon => 3,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs51",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :quadratic,
  :contype => :linear,
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

get_hs51_meta(; n::Integer = default_nvar) = (hs51_meta[:nvar], hs51_meta[:ncon])
