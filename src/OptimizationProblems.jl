module OptimizationProblems

using DataFrames, JuMP

path = dirname(@__FILE__)
files = filter(x -> x[end-2:end] == ".jl", readdir(path))
for file in files
  if file ≠ "OptimizationProblems.jl"
    include(file)
  end
end

const objtypes = [:none, :constant, :linear, :quadratic, :sum_of_squares, :other]
const contypes = [:unconstrained, :linear, :quadratic, :general]
const origins = [:academic, :modelling, :real]

const names = [
  :nvar
  :variable_size
  :x0
  :ncon
  :variable_con_size
  :y0
  :nnzo
  :nnzh
  :nnzj
  :minimize
  :name
  :global_solution
  :local_solution
  :optimal_value
  :has_multiple_solution
  :is_infeasible
  :objtype
  :contype
  :origin
  :deriv
  :not_everywhere_defined
  :has_cvx_obj
  :has_cvx_con
  :has_equalities_only
  :has_bounds
  :has_fixed_variables
]

const types = [
  Int
  Bool
  Vector
  Int
  Bool
  Vector
  Int
  Int
  Int
  Bool
  String
  Vector
  Tuple
  Real
  Bool
  Bool
  Symbol
  Symbol
  Symbol
  UInt8
  Bool
  Bool
  Bool
  Bool
  Bool
  Bool
]

const number_of_problems = length(files)

"""
    OptimizationProblems.meta

A composite type that represents the main features of the optimization problem.

    optimize    obj(x)
    subject to  lvar ≤    x    ≤ uvar
                lcon ≤ cons(x) ≤ ucon

---

The following keys are valid:
Problem meta
- `nvar`: number of general constraints
- `variable_size`: true if we can modify problem size
- `x0`: initial guess
- `ncon`: number of general constraints
- `variable_con_size`: true if we can modify problem size
- `y0`: initial Lagrange multipliers
- `nnzo`: number of nonzeros in all objectives gradients
- `nnzh`: number of elements needed to store the nonzeros in the sparse Hessian
- `nnzj`: number of elements needed to store the nonzeros in the sparse Jacobian
- `minimize`: true if optimize == minimize
- `name`: problem name
Solution meta
- `global_solution`: a global solution
- `local_solution`: tuple of local solutions
- `optimalvalue`: best known objective value (NaN if unknown, -Inf if unbounded problem)
- `has_multiple_solution`: true if the problem has more than one global solution
- `is_infeasible`: true if problem is infeasible
Classification
- `objtype`: #in objtypes
- `contype`: #in contypes
- `origin`: #in origins
- `deriv`: UInt8 with the largest order derivatives available
- `not_everywhere_defined`: true if the problem might return NaN or Inf outside the bounds
- `has_cvx_obj`: true if the problem has a convex objective
- `has_cvx_con`: true if the problem has convex constraints
- `has_equalities_only`: true if the problem constraints are equality constraints (doesn't include bounds)
- `has_bounds`: true if the problem has bound constraints
- `has_fixed_variables`: true if it has fixed variables
"""
const meta = DataFrame(
  types, 
  names, 
  number_of_problems
)

for i=1:number_of_problems
  # first(split(files[i], "."))*"_meta" (instead of "AMPGO02_meta")
  OptimizationProblems.meta[i,:] = eval(Meta.parse("AMPGO02_meta"))
end

end # module
