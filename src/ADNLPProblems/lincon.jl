export lincon 
 
function lincon(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  A = [1 2; 3 4]
  b = [5; 6]
  B = LinearAlgebra.diagm([3 * i for i = 3:5])
  c = [1; 2; 3]
  C = [0 -2; 4 0]
  d = [1; -1]

  x0 = zeros(T, 15)
  f(x) = sum(i + x[i]^4 for i = 1:15)
  con(x) = T[
    15 * x[15]
    c' * x[10:12]
    d' * x[13:14]
    b' * x[8:9]
    C * x[6:7]
    A * x[1:2]
    B * x[3:5]
  ]

  lcon = T[22; 1; -Inf; -11; -d; -b; -Inf * ones(3)]
  ucon = T[22; Inf; 16; 9; -d; Inf * ones(2); c]

  return ADNLPModels.ADNLPModel(f, x0, con, lcon, ucon, name = "lincon_autodiff"; kwargs...)
end

lincon_meta = Dict(
  :nvar => 15,
  :variable_size => false,
  :ncon => 11,
  :variable_con_size => false,
  :minimize => true,
  :name => "lincon",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :other,
  :contype => :linear,
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

get_lincon_meta(; n::Integer = default_nvar) = (lincon_meta[:nvar], lincon_meta[:ncon])
