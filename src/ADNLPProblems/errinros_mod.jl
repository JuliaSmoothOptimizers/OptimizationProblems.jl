function errinros_mod(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("errinros : n ≥ 2")
  function f(x)
    n = length(x)
    return sum((x[i - 1] - 16 * x[i]^2 * T(1.5 + sin(i))^2)^2 for i = 2:n) +
           sum((1 - x[i])^2 for i = 2:n)
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "errinros_autodiff"; kwargs...)
end

errinros_mod_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :minimize => true,
  :name => "errinros_mod",
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

get_errinros_mod_meta(; n::Integer = default_nvar) = (n, 0)
