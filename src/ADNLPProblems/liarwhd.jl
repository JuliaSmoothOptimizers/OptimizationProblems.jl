function liarwhd(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("liarwhd : n ≥ 2")
  function f(x)
    n = length(x)
    return sum(4 * (x[i]^2 - x[1])^2 + (x[i] - 1)^2 for i = 1:n)
  end
  x0 = ones(T, n)
  return ADNLPModel(f, x0, name = "liarwhd_autodiff"; kwargs...)
end

liarwhd_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "liarwhd",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => false,
  :objtype => :sum_of_squares,
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

get_liarwhd_meta(; n::Integer = default_nvar) = (n, 0)
