export brownden

function brownden(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 4 && @warn("brownden: must have n ≥ 4")
  n = max(n, 4)
  x0 = T[25.0; 5.0; -5.0; -1.0]
  t = T[i / 5 for i = 1:n]
  function f(x)
    return sum(
      ((x[1] + t[i] * x[2] - exp(t[i]))^2 + (x[3] + x[4] * sin(t[i]) - cos(t[i]))^2)^2 for i = 1:n
    )
  end

  return ADNLPModels.ADNLPModel(f, x0, name = "brownden_autodiff"; kwargs...)
end

brownden_meta = Dict(
  :nvar => 4,
  :variable_size => false,
  :ncon => 0,
  :variable_con_size => false,
  :minimize => true,
  :name => "brownden",
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

get_brownden_meta(; n::Integer = default_nvar) = (brownden_meta[:nvar], brownden_meta[:ncon])
