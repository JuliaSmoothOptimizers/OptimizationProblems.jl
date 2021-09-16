function hs26(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModel(
    x -> (x[1] - x[2])^2 + (x[2] - x[3])^4,
    T[-2.6, 2.0, 2.0],
    x -> [(1 + x[2]^2) * x[1] + x[3]^4 - 3],
    zeros(T, 1),
    zeros(T, 1),
    name = "hs26_autodiff";
    kwargs...,
  )
end

hs26_meta = Dict(
  :nvar => 3,
  :variable_size => false,
  :ncon => 1,
  :variable_con_size => false,
  :nnzo => 3,
  :nnzh => 6,
  :nnzj => 3,
  :minimize => true,
  :name => "hs26",
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

get_hs26_meta(; n::Integer = default_nvar) = (hs26_meta[:nvar], hs26_meta[:ncon])
