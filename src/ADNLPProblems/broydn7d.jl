export broydn7d 
 
function broydn7d(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n2 = max(1, div(n, 2))
  n = 2 * n2  # number of variables adjusted to be even
  function f(x)
    n = length(x)
    p = T(7 / 3)
    return abs(1 - 2 * x[2] + (3 - x[1] / 2) * x[1])^p +
           sum(abs(1 - x[i - 1] - 2 * x[i + 1] + (3 - x[i] / 2) * x[i])^p for i = 2:(n - 1)) +
           abs(1 - x[n - 1] + (3 - x[n] / 2) * x[n])^p +
           sum(abs(x[i] + x[i + n2])^p for i = 1:n2)
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "broydn7d_autodiff"; kwargs...)
end

broydn7d_meta = Dict(
  :nvar => default_nvar, # n must be greater than 3
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "broydn7d",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => false,
  :objtype => :other,
  :contype => :unconstrained,
  :origin => :unknown,
  :deriv => UInt8(2), # more?
  :not_everywhere_defined => false,
  :has_cvx_obj => false,
  :has_cvx_con => false,
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_broydn7d_meta(; n::Integer = default_nvar) = (2 * max(1, div(n, 2)), 0)
