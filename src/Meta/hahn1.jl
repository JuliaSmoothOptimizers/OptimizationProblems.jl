hahn1_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hahn1",
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
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/hahn1.dat

NIST/ITL StRD
Dataset Name:  Hahn1             (Hahn1.dat)

File Format:   ASCII
               Starting Values   (lines 41 to  47)
               Certified Values  (lines 41 to  52)
               Data              (lines 61 to 296)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study involving
               the thermal expansion of copper.  The response 
               variable is the coefficient of thermal expansion, and
               the predictor variable is temperature in degrees 
               kelvin.

Reference:     Hahn, T., NIST (197?). 
               Copper Thermal Expansion Study.

Data:          1 Response  (y = coefficient of thermal expansion)
               1 Predictor (x = temperature, degrees kelvin)
               236 Observations
               Average Level of Difficulty
               Observed Data

Model:         Rational Class (cubic/cubic)
               7 Parameters (b1 to b7)

               y = (b1+b2*x+b3*x**2+b4*x**3) /
                   (1+b5*x+b6*x**2+b7*x**3)  +  e
# T. Migot, Montreal, 2023.
                   """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hahn1_nvar(; n::Integer = default_nvar, kwargs...) = 7
get_hahn1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hahn1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hahn1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hahn1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hahn1_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_hahn1_nls_nequ(; n::Integer = default_nvar, kwargs...) = 236
