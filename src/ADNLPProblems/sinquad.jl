export sinquad 
 
function sinquad(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 3 && @warn("sinquad: number of variables must be ≥ 3")
  n = max(3, n)
  function f(x)
    n = length(x)
    return (x[1] - 1)^4 +
           (x[n]^2 - x[1]^2)^2 +
           sum((sin(x[i] - x[n]) - x[1]^2 + x[i]^2)^2 for i = 2:(n - 1))
  end
  x0 = ones(T, n) / 10
  return ADNLPModels.ADNLPModel(f, x0, name = "sinquad_autodiff"; kwargs...)
end

sinquad_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :minimize => true,
  :name => "sinquad",
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

get_sinquad_meta(; n::Integer = default_nvar) = (n, 0)
