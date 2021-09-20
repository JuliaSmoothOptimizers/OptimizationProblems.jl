function dixon3dq(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] - 1)^2 + (x[n] - 1)^2 + sum((x[i] - x[i + 1])^2 for i = 2:(n - 1))
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "dixon3dq_autodiff"; kwargs...)
end

dixon3dq_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :minimize => true,
  :name => "dixon3dq",
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

get_dixon3dq_meta(; n::Integer = default_nvar) = (n, 0)
