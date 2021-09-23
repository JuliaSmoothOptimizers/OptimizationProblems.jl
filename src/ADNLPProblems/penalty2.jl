export penalty2 
 
function penalty2(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 3 || error("penalty2 : n ≥ 3")
  function f(x)
    n = length(x)
    a = T(1.0e-5)
    m = 2 * n
    y = ones(T, m)
    for i = 1:m
      y[i] = exp(i / 10) + exp((i - 1) / 10)
    end
    return (x[1] - T(0.2))^2 +
           sum(a * (exp(x[i] / 10) + exp(x[i - 1] / 10) - y[i])^2 for i = 2:n) +
           sum(a * (exp(x[i - n + 1] / 10) - T(exp(-1 / 10)))^2 for i = (n + 1):(2 * n - 1)) +
           (sum((n - j + 1) * x[j]^2 for j = 1:n) - 1)^2
  end
  x0 = ones(T, n) / 2
  return ADNLPModels.ADNLPModel(f, x0, name = "penalty2_autodiff"; kwargs...)
end

penalty2_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "penalty2",
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

get_penalty2_meta(; n::Integer = default_nvar) = (n, 0)
