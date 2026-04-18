rat43_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "rat43",
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
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/rat43.dat

NIST/ITL StRD
Dataset Name:  Rat43             (Rat43.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 44)
               Certified Values  (lines 41 to 49)
               Data              (lines 61 to 75)

Procedure:     Nonlinear Least Squares Regression

Description:   This model and data are an example of fitting  
               sigmoidal growth curves taken from Ratkowsky (1983).  
               The response variable is the dry weight of onion bulbs 
               and tops, and the predictor variable is growing time. 

Reference:     Ratkowsky, D.A. (1983).  
               Nonlinear Regression Modeling.
               New York, NY:  Marcel Dekker, pp. 62 and 88.

Data:          1 Response  (y = onion bulb dry weight)
               1 Predictor (x = growing time)
               15 Observations
               Higher Level of Difficulty
               Observed Data

Model:         Exponential Class
               4 Parameters (b1 to b4)

               y = b1 / ((1+exp[b2-b3*x])**(1/b4))  +  e

T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_rat43_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_rat43_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_rat43_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_rat43_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_rat43_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_rat43_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_rat43_nls_nequ(; n::Integer = default_nvar, kwargs...) = 15
