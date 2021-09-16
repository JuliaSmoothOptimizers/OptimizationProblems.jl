function morebv(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("morebv : n ≥ 2")
  function f(x)
    n = length(x)
    h = T(1 / (n - 1))
    return sum(
      (2 * x[i] - x[i - 1] - x[i + 1] + (h^2 / 2) * (x[i] + (i - 1) * h + 1)^3)^2 for i = 2:(n - 1)
    )
  end

  x0 = ones(T, n) / 2
  x0[1] = zero(T)
  x0[n] = zero(T)

  return ADNLPModel(f, x0, name = "morebv_autodiff"; kwargs...)
end

morebv_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "morebv",
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

get_morebv_meta(; n::Integer = default_nvar) = (n, 0)
