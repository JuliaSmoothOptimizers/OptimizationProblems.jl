export powellsg 
 
function powellsg(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  (n % 4 == 0) || @warn("powellsg: number of variables adjusted to be a multiple of 4")
  n = 4 * max(1, div(n, 4))  # number of variables adjusted to be a multiple of 4
  function f(x)
    n = length(x)
    return sum(
      (x[j] + 10 * x[j + 1])^2 +
      5 * (x[j + 2] - x[j + 3])^2 +
      (x[j + 1] - 2 * x[j + 2])^4 +
      10 * (x[j] - x[j + 3])^4 for j = 1:4:n
    )
  end
  x0 = zeros(T, n)
  x0[4 * (collect(1:div(n, 4))) .- 3] .= 3
  x0[4 * (collect(1:div(n, 4))) .- 2] .= -1
  x0[4 * (collect(1:div(n, 4)))] .= 1
  return ADNLPModels.ADNLPModel(f, x0, name = "powellsg_autodiff"; kwargs...)
end

powellsg_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "powellsg",
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

get_powellsg_meta(; n::Integer = default_nvar) = (n, 0)
