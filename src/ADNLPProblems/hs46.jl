export hs46 
 
function hs46(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - x[2])^2 + (x[3] - 1)^2 + (x[4] - 1)^4 + (x[5] - 1)^6,
    T[sqrt(2) / 2, 1.75, 0.5, 2, 2],
    x -> [(x[1]^2) * x[4] + sin(x[4] - x[5]) - 1; x[2] + (x[3]^4) * (x[4]^2) - 2],
    zeros(T, 2),
    zeros(T, 2),
    name = "hs46_autodiff";
    kwargs...,
  )
end

hs46_meta = Dict(
  :nvar => 5,
  :variable_size => false,
  :ncon => 2,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs46",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :sum_of_squares,
  :contype => :general,
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

get_hs46_meta(; n::Integer = default_nvar) = (hs46_meta[:nvar], hs46_meta[:ncon])
