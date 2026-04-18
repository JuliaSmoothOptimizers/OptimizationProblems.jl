kirby2_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "kirby2",
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
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/kirby2.dat

NIST/ITL StRD
Dataset Name:  Kirby2            (Kirby2.dat)

File Format:   ASCII
               Starting Values   (lines 41 to  45)
               Certified Values  (lines 41 to  50)
               Data              (lines 61 to 211)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study involving
               scanning electron microscope line with standards.

Reference:     Kirby, R., NIST (197?).  
               Scanning electron microscope line width standards.

Data:          1 Response  (y)
               1 Predictor (x)
               151 Observations
               Average Level of Difficulty
               Observed Data

Model:         Rational Class (quadratic/quadratic)
               5 Parameters (b1 to b5)

               y = (b1 + b2*x + b3*x**2) /
                   (1 + b4*x + b5*x**2)  +  e

T. Migot, Montreal, 2023.
                   """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_kirby2_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_kirby2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_kirby2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_kirby2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_kirby2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_kirby2_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_kirby2_nls_nequ(; n::Integer = default_nvar, kwargs...) = 151
