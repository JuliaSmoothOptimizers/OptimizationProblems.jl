export vardim

function vardim(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sum((x[i] - 1)^2 for i = 1:n) +
           sum(i * (x[i] - 1) for i = 1:n)^2 +
           sum(i * (x[i] - 1) for i = 1:n)^4
  end

  x0 = T.([1 - i / n for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "vardim_autodiff"; kwargs...)
end

vardim_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :minimize => true,
  :name => "vardim",
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

get_vardim_meta(; n::Integer = default_nvar) = (n, 0)
