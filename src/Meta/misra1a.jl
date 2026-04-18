misra1a_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "misra1a",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 500.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/misra1a.dat

NIST/ITL StRD
Dataset Name:  misra1a           (misra1a.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 42)
               Certified Values  (lines 41 to 47)
               Data              (lines 61 to 74)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study regarding
               dental research in monomolecular adsorption.  The
               response variable is volume, and the predictor
               variable is pressure.

Reference:     Misra, D., NIST (1978).  
               Dental Research Monomolecular Adsorption Study.

Data:          1 Response Variable  (y = volume)
               1 Predictor Variable (x = pressure)
               14 Observations
               Lower Level of Difficulty
               Observed Data

Model:         Exponential Class
               2 Parameters (b1 and b2)

               y = b1*(1-exp[-b2*x])  +  e

T. Migot, Montreal, 2023.
  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_misra1a_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_misra1a_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_misra1a_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_misra1a_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_misra1a_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_misra1a_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_misra1a_nls_nequ(; n::Integer = default_nvar, kwargs...) = 14
