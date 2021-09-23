export ncb20b 
 
function ncb20b(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 20 || error("ncb20 : n ≥ 20")
  function f(x)
    n = length(x)
    h = T(1 / (n - 1))
    return sum(
      T(10 / i) * (sum(x[i + j - 1] / (1 + x[i + j - 1]^2) for j = 1:20))^2 -
      T(0.2) * sum(x[i + j - 1] for j = 1:20) for i = 1:(n - 19)
    ) + sum(100 * x[i]^4 + 2 for i = 1:n)
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "ncb20b_autodiff"; kwargs...)
end

ncb20b_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :minimize => true,
  :name => "ncb20b",
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

get_ncb20b_meta(; n::Integer = default_nvar) = (n, 0)
