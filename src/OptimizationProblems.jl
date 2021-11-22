module OptimizationProblems

using DataFrames

include("ADNLPProblems/ADNLPProblems.jl")
include("PureJuMP/PureJuMP.jl")

const default_nvar = ADNLPProblems.default_nvar

export PureJuMP, ADNLPProblems

path = dirname(@__FILE__)
files = filter(x -> x[(end - 2):end] == ".jl", readdir(path * "/Meta"))
for file in files
  include("Meta/" * file)
end
number_of_problems = length(files)

const names = [
  :nvar
  :variable_nvar
  :ncon
  :variable_ncon
  :minimize
  :name
  :has_equalities_only
  :has_inequalities_only
  :has_bounds
  :has_fixed_variables
  :objtype
  :contype
  :best_known_lower_bound
  :best_known_upper_bound
  :is_feasible
  :defined_everywhere
  :origin
]

const types = [
  Int
  Bool
  Int
  Bool
  Bool
  String
  Bool
  Bool
  Bool
  Bool
  Symbol
  Symbol
  Real
  Real
  Union{Bool, Missing}
  Union{Bool, Missing}
  Symbol
]

"""
OptimizationProblems.meta
A composite type that represents the main features of the optimization problem.
    optimize    obj(x)
    subject to  lvar ≤    x    ≤ uvar
                lcon ≤ cons(x) ≤ ucon
---
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
const meta = DataFrame(names .=> [Array{T}(undef, number_of_problems) for T in types])

for name in names, i = 1:number_of_problems
  meta[!, name][i] = eval(Meta.parse("$(split(files[i], ".")[1])_meta"))[name]
end

end # module
