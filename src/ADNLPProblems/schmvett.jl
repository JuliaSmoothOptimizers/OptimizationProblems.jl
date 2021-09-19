function schmvett(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sum(
      -(1 / (1 + (x[i] - x[i + 1])^2)) - sin((π * x[i + 1] + x[i + 2]) / 2) -
      exp(-((x[i] + x[i + 2]) / x[i + 1] - 2)^2) for i = 1:(n - 2)
    )
  end
  x0 = 3 * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "schmvett_autodiff"; kwargs...)
end

schmvett_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "schmvett",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => false,
  :objtype => :other,
  :contype => :unconstrained,
  :origin => :unknown,
  :deriv => UInt8(0),
  :not_everywhere_defined => true, # not defined in 0
  :has_cvx_obj => false,
  :has_cvx_con => false,
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_schmvett_meta(; n::Integer = default_nvar) = (n, 0)
