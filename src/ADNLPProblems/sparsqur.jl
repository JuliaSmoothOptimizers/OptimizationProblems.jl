function sparsqur(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 10 || error("sparsqur : n ≥ 10")
  function f(x)
    n = length(x)
    return T(1 / 8) * sum(
      i *
      (
        x[i]^2 +
        x[mod(2 * i - 1, n) + 1]^2 +
        x[mod(3 * i - 1, n) + 1]^2 +
        x[mod(5 * i - 1, n) + 1]^2 +
        x[mod(7 * i - 1, n) + 1]^2 +
        x[mod(11 * i - 1, n) + 1]^2
      )^2 for i = 1:n
    )
  end
  x0 = ones(T, n) / 2
  return ADNLPModels.ADNLPModel(f, x0, name = "sparsqur_autodiff"; kwargs...)
end

sparsqur_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "sparsqur",
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

get_sparsqur_meta(; n::Integer = default_nvar) = (n, 0)
