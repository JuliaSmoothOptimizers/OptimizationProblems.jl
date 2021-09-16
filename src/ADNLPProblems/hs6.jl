function hs6(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModel(
    x -> (x[1] - 1)^2,
    T[-1.2; 1.0],
    x -> [10 * (x[2] - x[1]^2)],
    zeros(T, 1),
    zeros(T, 1),
    name = "hs6_autodiff";
    kwargs...,
  )
end

hs6_meta = Dict(
  :nvar => 2,
  :variable_size => false,
  :ncon => 1,
  :variable_con_size => false,
  :nnzo => 2,
  :nnzh => 3,
  :nnzj => 2,
  :minimize => true,
  :name => "hs6",
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
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_hs6_meta(; n::Integer = default_nvar) = (hs6_meta[:nvar], hs6_meta[:ncon])
