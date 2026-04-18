mgh10_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "mgh10",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 500.0,
  :is_feasible => true,
  :defined_everywhere => false,
  :origin => :academic,
  :url => "",
  :notes => raw"""
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/mgh10.dat

NIST/ITL StRD
Dataset Name:  MGH10             (MGH10.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 43)
               Certified Values  (lines 41 to 48)
               Data              (lines 61 to 76)

Procedure:     Nonlinear Least Squares Regression

Description:   This problem was found to be difficult for some very
               good algorithms.

               See More, J. J., Garbow, B. S., and Hillstrom, K. E. 
               (1981).  Testing unconstrained optimization software.
               ACM Transactions on Mathematical Software. 7(1): 
               pp. 17-41.

Reference:     Meyer, R. R. (1970).  
               Theoretical and computational aspects of nonlinear 
               regression.  In Nonlinear Programming, Rosen, 
               Mangasarian and Ritter (Eds).  
               New York, NY: Academic Press, pp. 465-486.

Data:          1 Response  (y)
               1 Predictor (x)
               16 Observations
               Higher Level of Difficulty
               Generated Data

Model:         Exponential Class
               3 Parameters (b1 to b3)

               y = b1 * exp[b2/(x+b3)]  +  e
T. Migot, Montreal, 2023.
               """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_mgh10_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_mgh10_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_mgh10_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_mgh10_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_mgh10_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_mgh10_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_mgh10_nls_nequ(; n::Integer = default_nvar, kwargs...) = 16
