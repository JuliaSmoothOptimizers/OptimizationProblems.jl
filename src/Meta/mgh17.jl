mgh17_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "mgh17",
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
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/mgh17.dat

NIST/ITL StRD
Dataset Name:  MGH17             (MGH17.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 45)
               Certified Values  (lines 41 to 50)
               Data              (lines 61 to 93)

Procedure:     Nonlinear Least Squares Regression

Description:   This problem was found to be difficult for some very
               good algorithms.

               See More, J. J., Garbow, B. S., and Hillstrom, K. E.
               (1981).  Testing unconstrained optimization software.
               ACM Transactions on Mathematical Software. 7(1):
               pp. 17-41.

Reference:     Osborne, M. R. (1972).  
               Some aspects of nonlinear least squares 
               calculations.  In Numerical Methods for Nonlinear 
               Optimization, Lootsma (Ed).  
               New York, NY:  Academic Press, pp. 171-189.

Data:          1 Response  (y)
               1 Predictor (x)
               33 Observations
               Average Level of Difficulty
               Generated Data

Model:         Exponential Class
               5 Parameters (b1 to b5)

               y = b1 + b2*exp[-x*b4] + b3*exp[-x*b5]  +  e
T. Migot, Montreal, 2023.
               """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_mgh17_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_mgh17_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_mgh17_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_mgh17_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_mgh17_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_mgh17_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_mgh17_nls_nequ(; n::Integer = default_nvar, kwargs...) = 14
