rozman1_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "rozman1",
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
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/rozman1.dat

NIST/ITL StRD
Dataset Name:  Roszman1          (Roszman1.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 44)
               Certified Values  (lines 41 to 49)
               Data              (lines 61 to 85)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study involving
               quantum defects in iodine atoms.  The response
               variable is the number of quantum defects, and the
               predictor variable is the excited energy state.
               The argument to the ARCTAN function is in radians.

Reference:     Roszman, L., NIST (19??).  
               Quantum Defects for Sulfur I Atom.

Data:          1 Response  (y = quantum defect)
               1 Predictor (x = excited state energy)
               25 Observations
               Average Level of Difficulty
               Observed Data

Model:         Miscellaneous Class
               4 Parameters (b1 to b4)

               pi = 3.141592653589793238462643383279E0
               y =  b1 - b2*x - arctan[b3/(x-b4)]/pi  +  e
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_rozman1_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_rozman1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_rozman1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_rozman1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_rozman1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_rozman1_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_rozman1_nls_nequ(; n::Integer = default_nvar, kwargs...) = 25
