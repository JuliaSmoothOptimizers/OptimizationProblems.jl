function noncvxun(;
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  n ≥ 2 || error("noncvxun : n ≥ 2")
  function f(x)
    n = length(x)
    return sum(
      (x[i] + x[mod(2 * i - 1, n) + 1] + x[mod(3 * i - 1, n) + 1])^2 +
      4 * cos(x[i] + x[mod(2 * i - 1, n) + 1] + x[mod(3 * i - 1, n) + 1]) for i = 1:n
    )
  end
  x0 = T.([i for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "noncvxun_autodiff"; kwargs...)
end

noncvxun_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "noncvxun",
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

get_noncvxun_meta(; n::Integer = default_nvar) = (n, 0)
