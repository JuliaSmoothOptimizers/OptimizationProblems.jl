function freuroth(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sum(((5 - x[i + 1]) * x[i + 1]^2 + x[i] - 2 * x[i + 1] - 13)^2 for i = 1:(n - 1)) +
           sum(((1 + x[i + 1]) * x[i + 1]^2 + x[i] - 14 * x[i + 1] - 29)^2 for i = 1:(n - 1))
  end

  x0 = zeros(T, n)
  x0[1] = one(T) / 2
  x0[2] = -2 * one(T)
  return ADNLPModels.ADNLPModel(f, x0, name = "freuroth_autodiff"; kwargs...)
end

freuroth_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "freuroth",
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

get_freuroth_meta(; n::Integer = default_nvar) = (n, 0)
