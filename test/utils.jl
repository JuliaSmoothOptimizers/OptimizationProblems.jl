using ADNLPModels, NLPModels, NLPModelsJuMP, OptimizationProblems

function set_meta(all::AbstractVector{T}) where {T <: Union{Symbol, String}}
  for name in string.(all)
    io = open("src/Meta/" * name * ".jl", "w")
    write(io, generate_meta(name))
    close(io)
  end
end

function replace_entry_meta(
  all::AbstractVector{T},
  old_entry,
  new_entry,
) where {T <: Union{Symbol, String}}
  for name in string.(all)
    lines = readlines("src/Meta/" * name * ".jl")
    open("src/Meta/" * name * ".jl", "w") do io
      for line in lines
        write(io, replace(line, "$(old_entry)" => "$(new_entry)") * "\n")
      end
    end
  end
end

"""
  `generate_meta(model, name)`
  `generate_meta(name)`
  
  is used to generate the meta of a given NLPModel.

The following keys are valid:
  - `nvar::Int`: number of variables
  - `variable_nvar::Bool`: true if we can modify the number of variables
  - `ncon::Int`: number of general constraints
  - `variable_ncon::Bool`: true if we can modify the number of constraints
  - `minimize::Bool`: true if optimize == minimize
  - `name::String`: problem name
  - `has_equalities_only::Bool`: true if the problem has constraints, and all are equality constraints (doesn't include bounds)
  - `has_inequalities_only::Bool`: true if the problem has constraints, and all are inequality constraints (doesn't include bounds)
  - `has_bounds::Bool`: true if the problem has bound constraints
  - `has_fixed_variables::Bool`: true if it has fixed variables
  - `objtype::Symbol`: type of objective, in [:none, :constant, :linear, :quadratic, :sum_of_squares, :other]
  - `contype::Symbol`: type of constraint, in [:unconstrained, :linear, :quadratic, :general]
  - `best_known_lower_bound::Real`: lower bound on the global optimal value (default: -Inf for minimization problem, f(x0) for maximization problem if x0 is feasible, -Inf otherwise)
  - `best_known_upper_bound::Real`: upper bound on the global optimal value (default: Inf for maximization problem, f(x0) for minimization problem if x0 is feasible, Inf otherwise)
  - `is_feasible::Union{Bool, Missing}`: true if problem is feasible
  - `origin::Symbol`: origin of the problem, in [:academic, :modelling, :real, :unknown]
"""
function generate_meta(nlp::AbstractNLPModel, name::String)
  contype = if get_ncon(nlp) == 0 && length(get_ifree(nlp)) >= get_nvar(nlp)
    :unconstrained
  elseif get_nlin(nlp) == get_ncon(nlp) > 0
    :linear
  else
    :general
  end
  objtype = :other

  origin = :unknown

  default_nvar = ADNLPProblems.default_nvar
  if name in ["clplatea", "clplateb", "clplatec", "fminsrf2"] # issue because variable is a matrix
    variable_nvar, variable_ncon = false, false
    nvar_formula = "$(get_nvar(nlp))"
    ncon_formula = "$(get_ncon(nlp))"
    nlin_formula = "$(get_nlin(nlp))"
    nnln_formula = "$(get_nnln(nlp))"
    nequ_formula = "$(length(get_jfix(nlp)))"
    nineq_formula = "$(get_ncon(nlp) - length(get_jfix(nlp)))"
  else
    variable_nvar, nvar_formula = var_size(name, get_nvar, default_nvar)
    variable_ncon, ncon_formula = var_size(name, get_ncon, default_nvar)
    nlin_formula = var_size(name, get_nlin, default_nvar)[2]
    nnln_formula = var_size(name, get_nnln, default_nvar)[2]
    nequ_formula = var_size(name, nlp -> length(get_jfix(nlp)), default_nvar)[2]
    nineq_formula = var_size(name, nlp -> get_ncon(nlp) - length(get_jfix(nlp)), default_nvar)[2]
  end

  x0_is_feasible = is_feasible(nlp)
  if get_minimize(nlp)
    bnlb = -Inf
    bnub = x0_is_feasible ? obj(nlp, nlp.meta.x0) : Inf
  else
    bnub = Inf
    bnlb = x0_is_feasible ? obj(nlp, nlp.meta.x0) : -Inf
  end

  str = "$(name)_meta = Dict(
  :nvar => $(get_nvar(nlp)),
  :variable_nvar => $(variable_nvar),
  :ncon => $(get_ncon(nlp)),
  :variable_ncon => $(variable_ncon),
  :minimize => $(get_minimize(nlp)),
  :name => \"$(name)\",
  :has_equalities_only => $(length(get_jfix(nlp)) == get_ncon(nlp) > 0),
  :has_inequalities_only => $(get_ncon(nlp) > 0 && length(get_jfix(nlp)) == 0),
  :has_bounds => $(length(get_ifree(nlp)) < get_nvar(nlp)),
  :has_fixed_variables => $(get_ifix(nlp) != []),
  :objtype => :$(objtype),
  :contype => :$(contype),
  :best_known_lower_bound => $(bnlb),
  :best_known_upper_bound => $(bnub),
  :is_feasible => $(x0_is_feasible),
  :defined_everywhere => $(missing),
  :origin => :$(origin),
)
get_$(name)_nvar(; n::Integer = default_nvar, kwargs...) = $nvar_formula
get_$(name)_ncon(; n::Integer = default_nvar, kwargs...) = $ncon_formula
get_$(name)_nlin(; n::Integer = default_nvar, kwargs...) = $nlin_formula
get_$(name)_nnln(; n::Integer = default_nvar, kwargs...) = $nnln_formula
get_$(name)_nequ(; n::Integer = default_nvar, kwargs...) = $nequ_formula
get_$(name)_nineq(; n::Integer = default_nvar, kwargs...) = $nineq_formula
"
  return str
end

function generate_meta(name::String, args...; kwargs...)
  nlp = if name != "hs61" && name in string.(names(PureJuMP))
    eval(Meta.parse("MathOptNLPModel(PureJuMP." * name * "())"))
  else
    eval(Meta.parse("ADNLPProblems." * name * "()"))
  end
  return generate_meta(nlp, name, args...; kwargs...)
end

function is_feasible(nlp::AbstractNLPModel; x = nlp.meta.x0)
  feasible = missing
  if get_ncon(nlp) == 0
    feasible = true
  else
    c = cons(nlp, x)
    if all(get_lcon(nlp) .<= c .<= get_ucon(nlp)) && all(get_lvar(nlp) .<= x .<= get_uvar(nlp))
      feasible = true
    end
    if any(get_lvar(nlp) .> get_uvar(nlp)) || any(get_lcon(nlp) .> get_ucon(nlp))
      feasible = false
    end
  end
  return feasible
end

function var_size(name::String, get_field::Function, default_nvar)
  n1 = default_nvar
  n2 = div(default_nvar, 2)

  nlp1 = eval(Meta.parse("ADNLPProblems." * name))(n = n1)
  nvar1 = get_field(nlp1)
  nlp2 = eval(Meta.parse("ADNLPProblems." * name))(n = n2)
  nvar2 = get_field(nlp2)
  variable_nvar = nvar1 != nvar2
  #Assuming the scale is linear in n
  nvar_formula = if !variable_nvar
    string(nvar1)
  else
    a = div(nvar1 - nvar2, n1 - n2)
    b = nvar2 - a * n2
    "$a * n + $b"
  end
  return variable_nvar, nvar_formula
end
