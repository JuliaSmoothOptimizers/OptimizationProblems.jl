export hs49 
 
function hs49(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - x[2])^2 + (x[3] - 1)^2 + (x[4] - 1)^4 + (x[5] - 1)^6,
    T[10, 7, 2, -3, 0.8],
    x -> [x[1] + x[2] + x[3] + 4 * x[4] - 7; x[3] + 5 * x[5] - 6],
    zeros(T, 2),
    zeros(T, 2),
    name = "hs49_autodiff";
    kwargs...,
  )
end

hs49_meta = Dict(
  :nvar => 5,
  :variable_size => false,
  :ncon => 2,
  :variable_con_size => false,
  :nnzo => 5,
  :nnzh => 15,
  :nnzj => 10,
  :minimize => true,
  :name => "hs49",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :sum_of_squares,
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

get_hs49_meta(; n::Integer = default_nvar) = (hs49_meta[:nvar], hs49_meta[:ncon])
