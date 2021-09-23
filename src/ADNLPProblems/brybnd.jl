function brybnd(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    ml = 5
    mu = 1
    return sum(
      (
        x[i] * (2 + 5 * x[i]^2) + 1 -
        sum(x[j] * (1 + x[j]) for j = max(1, i - ml):min(n, i + mu) if j != i)
      )^2 for i = 1:n
    )
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "brybnd_autodiff"; kwargs...)
end

brybnd_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :minimize => true,
  :name => "brybnd",
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

get_brybnd_meta(; n::Integer = default_nvar) = (n, 0)
