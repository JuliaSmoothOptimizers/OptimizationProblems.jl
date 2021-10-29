using ADNLPModels, NLPModels, NLPModelsJuMP, OptimizationProblems

function set_meta(all::AbstractVector{T}) where T <: Union{Symbol, String}
  for name in string.(all)
    io = open("src/Meta/" * name * ".jl", "w")
    write(io, generate_meta(name))
    close(io)
  end
end

"""
  `generate_meta(model, name)`
  `generate_meta(name)`
  
  is used to generate the meta of a given NLPModel.

Default values for undetermined entries:
- `contype`: `:general` (`:linear` if `nlp.meta.nlin == nlp.meta.ncon`, or `unconstrained`)
- `objtype`: `:other`
- `cvx_obj`: `false`
- `cvx_feasible_set`: `false` (`true` if unconstrained)
- `cq`: `UInt8(0)`
- `optimal_value`: `NaN`
- `has_multiple_solutions`: `missing`
- `everywhere_defined`: `missing`
- `origin`: `:unknown`
- `deriv`: `UInt8(0)`
`is_infeasible` is `missing` unless the problem is unconstrained or `nlp.meta.x0` is feasible.
"""
function generate_meta(nlp::AbstractNLPModel, name::String)
  contype = if nlp.meta.ncon == 0 && !(length(nlp.meta.ifree) < nlp.meta.nvar)
    :unconstrained
  elseif nlp.meta.nlin == nlp.meta.ncon > 0
    :linear
  else
    :general
  end
  objtype = :other

  cvx_obj = missing
  cvx_feasible_set = nlp.meta.ncon == 0 ? true : missing

  cq = UInt8(0)

  origin = :unknown

  default_nvar = ADNLPProblems.default_nvar
  if name in ["clplatea", "clplateb", "clplatec", "fminsrf2"] # issue because variable is a matrix
    variable_size, variable_con_size = false, false
    nvar_formula, ncon_formula = "$(nlp.meta.nvar)", "$(nlp.meta.ncon)" # default values, to be modified
  else
    variable_size, variable_con_size, nvar_formula, ncon_formula = var_size(name, default_nvar)
  end

  str = "$(name)_meta = Dict(
  :nvar => $(nlp.meta.nvar),
  :variable_size => $(variable_size),
  :ncon => $(nlp.meta.ncon),
  :variable_con_size => $(variable_con_size),
  :minimize => $(nlp.meta.minimize),
  :name => \"$(name)\",
  :has_equalities_only => $(length(nlp.meta.jfix) == nlp.meta.ncon > 0),
  :has_inequalities_only => $(nlp.meta.ncon > 0 && length(nlp.meta.jfix) == 0),
  :has_bounds => $(length(nlp.meta.ifree) < nlp.meta.nvar),
  :has_fixed_variables => $(nlp.meta.ifix != []),
  :objtype => :$(objtype),
  :contype => :$(contype),
  :cvx_obj => $(cvx_obj),
  :cvx_feasible_set => $(cvx_feasible_set),
  :cqs => $(cq),
  :optimal_value => $(NaN),
  :has_multiple_solutions => $(missing),
  :is_infeasible => $(is_infeasible(nlp)),
  :everywhere_defined => $(missing),
  :origin => :$(origin),
  :deriv => UInt8(0),
)
get_$(name)_meta(; n::Integer = default_nvar) = ($nvar_formula, $ncon_formula)
"
  return str
end

function generate_meta(name::String, args...; kwargs...)
  nlp = if name != "hs61" && name in string.(names(PureJuMP))
    eval(Meta.parse("MathOptNLPModel(PureJuMP." * name * "())"))
  else
    eval(Meta.parse("ADNLPProblems." * name * "()"))
  end
  return generate_meta(
    nlp,
    name,
    args...;
    kwargs...,
  )
end

function is_infeasible(nlp::AbstractNLPModel; x = nlp.meta.x0)
  infeasible = missing
  if nlp.meta.ncon == 0
    infeasible = false
  else
    c = cons(nlp, x)
    vio = max(maximum(c - nlp.meta.ucon), maximum(nlp.meta.lcon - c))
    if vio <= 0
      infeasible = false
    end
  end
  return infeasible
end

function var_size(name::String, default_nvar)
  n1 = default_nvar
  n2 = Int(default_nvar/2)

  nlp1 = eval(Meta.parse("ADNLPProblems." * name))(n=n1)
  nvar1, ncon1 = nlp1.meta.nvar, nlp1.meta.ncon
  nlp2 = eval(Meta.parse("ADNLPProblems." * name))(n=n2)
  nvar2, ncon2 = nlp2.meta.nvar, nlp2.meta.ncon
  variable_size, variable_con_size = nvar1 != nvar2, ncon1 != ncon2
  #Assuming the scale is linear in n
  nvar_formula = if !variable_size
    string(nvar1)
  else
    a = (nvar1 - nvar2) / (n1 - n2)
    b = nvar2 - a * n2
    "$a * n + $b"
  end
  ncon_formula = if !variable_size
    string(ncon1)
  else
    a = (ncon1 - ncon2) / (n1 - n2)
    b = ncon2 - a * n2
    "$a * n + $b"
  end
  return variable_size, variable_con_size, nvar_formula, ncon_formula
end
