thurber_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "thurber",
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
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/thurber.dat

NIST/ITL StRD
Dataset Name:  Thurber           (Thurber.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 47)
               Certified Values  (lines 41 to 52)
               Data              (lines 61 to 97)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study involving
               semiconductor electron mobility.  The response 
               variable is a measure of electron mobility, and the 
               predictor variable is the natural log of the density.

Reference:     Thurber, R., NIST (197?).  
               Semiconductor electron mobility modeling.

Data:          1 Response Variable  (y = electron mobility)
               1 Predictor Variable (x = log[density])
               37 Observations
               Higher Level of Difficulty
               Observed Data

Model:         Rational Class (cubic/cubic)
               7 Parameters (b1 to b7)

               y = (b1 + b2*x + b3*x**2 + b4*x**3) / 
                   (1 + b5*x + b6*x**2 + b7*x**3)  +  e
T. Migot, Montreal, 2023.
  
  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_thurber_nvar(; n::Integer = default_nvar, kwargs...) = 7
get_thurber_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_thurber_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_thurber_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_thurber_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_thurber_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_thurber_nls_nequ(; n::Integer = default_nvar, kwargs...) = 37
