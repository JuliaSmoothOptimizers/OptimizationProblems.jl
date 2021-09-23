function bdqrtic(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 5 || error("bdqrtic : n ≥ 5")
  function f(x)
    n = length(x)
    return sum(
      (3 - 4 * x[i])^2 + (x[i]^2 + 2 * x[i + 1]^2 + 3 * x[i + 2]^2 + 4 * x[i + 3]^2 + 5 * x[n]^2)^2
      for i = 1:(n - 4)
    )
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "bdqrtic_autodiff"; kwargs...)
end

bdqrtic_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :minimize => true,
  :name => "bdqrtic",
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

get_bdqrtic_meta(; n::Integer = default_nvar) = (n, 0)
