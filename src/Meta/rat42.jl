rat42_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "rat42",
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
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/rat42.dat

NIST/ITL StRD
Dataset Name:  Rat42             (Rat42.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 43)
               Certified Values  (lines 41 to 48)
               Data              (lines 61 to 69)

Procedure:     Nonlinear Least Squares Regression

Description:   This model and data are an example of fitting
               sigmoidal growth curves taken from Ratkowsky (1983).
               The response variable is pasture yield, and the
               predictor variable is growing time.

Reference:     Ratkowsky, D.A. (1983).  
               Nonlinear Regression Modeling.
               New York, NY:  Marcel Dekker, pp. 61 and 88.

Data:          1 Response  (y = pasture yield)
               1 Predictor (x = growing time)
               9 Observations
               Higher Level of Difficulty
               Observed Data

Model:         Exponential Class
               3 Parameters (b1 to b3)

               y = b1 / (1+exp[b2-b3*x])  +  e

T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_rat42_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_rat42_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_rat42_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_rat42_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_rat42_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_rat42_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_rat42_nls_nequ(; n::Integer = default_nvar, kwargs...) = 9
