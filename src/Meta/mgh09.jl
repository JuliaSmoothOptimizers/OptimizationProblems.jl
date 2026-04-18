mgh09_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "mgh09",
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
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/mgh09.dat

NIST/ITL StRD
Dataset Name:  MGH09             (MGH09.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 44)
               Certified Values  (lines 41 to 49)
               Data              (lines 61 to 71)

Procedure:     Nonlinear Least Squares Regression

Description:   This problem was found to be difficult for some very 
               good algorithms.  There is a local minimum at (+inf,
               -14.07..., -inf, -inf) with final sum of squares 
               0.00102734....

               See More, J. J., Garbow, B. S., and Hillstrom, K. E. 
               (1981).  Testing unconstrained optimization software.
               ACM Transactions on Mathematical Software. 7(1): 
               pp. 17-41.

Reference:     Kowalik, J.S., and M. R. Osborne, (1978).  
               Methods for Unconstrained Optimization Problems.  
               New York, NY:  Elsevier North-Holland.

Data:          1 Response  (y)
               1 Predictor (x)
               11 Observations
               Higher Level of Difficulty
               Generated Data

Model:         Rational Class (linear/quadratic)
               4 Parameters (b1 to b4)

               y = b1*(x**2+x*b2) / (x**2+x*b3+b4)  +  e
T. Migot, Montreal, 2023.
               """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_mgh09_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_mgh09_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_mgh09_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_mgh09_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_mgh09_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_mgh09_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_mgh09_nls_nequ(; n::Integer = default_nvar, kwargs...) = 11
