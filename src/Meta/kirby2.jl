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
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/KIRBY2.SIF",
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

NIST Data fitting problem KIRBY2 given as an inconsistent set of
nonlinear equations.
Fit: y = (b1 + b2*x + b3*x**2) /(1 + b4*x + b5*x**2) + e

classification NOR2-MN-5-151
""",
  :origin_notes => raw"""
Problem from the NIST nonlinear regression test set
http://www.itl.nist.gov/div898/strd/nls/nls_main.shtml
Reference: Kirby, R., NIST (197?).  
Scanning electron microscope line width standards.

SIF input: Nick Gould and Tyrone Rees, Oct 2015
""",
  :reference => raw"""
@misc{NISTStRD,
  author       = {{National Institute of Standards and Technology}},
  title        = {{NIST/ITL StRD}: Nonlinear Regression Reference Datasets},
  howpublished = {\url{https://www.itl.nist.gov/div898/strd/nls/nls_main.shtml}},
  year         = {1997}
}
""",
  :lib => "CUTEst:KIRBY2, NIST:Kirby2",
)
get_kirby2_nvar(; n::Int = default_nvar, kwargs...) = 5
get_kirby2_ncon(; n::Int = default_nvar, kwargs...) = 0
get_kirby2_nlin(; n::Int = default_nvar, kwargs...) = 0
get_kirby2_nnln(; n::Int = default_nvar, kwargs...) = 0
get_kirby2_nequ(; n::Int = default_nvar, kwargs...) = 0
get_kirby2_nineq(; n::Int = default_nvar, kwargs...) = 0
get_kirby2_nls_nequ(; n::Int = default_nvar, kwargs...) = 151
