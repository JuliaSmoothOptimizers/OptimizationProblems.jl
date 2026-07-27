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
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/THURBER.SIF",
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

NIST Data fitting problem THURBER given as an inconsistent set of
nonlinear equations.
Fit: y = (b1 + b2*x + b3*x**2 + b4*x**3) / 
(1 + b5*x + b6*x**2 + b7*x**3) + e

classification NOR2-MN-7-37
""",
  :origin_notes => raw"""
Problem from the NIST nonlinear regression test set
http://www.itl.nist.gov/div898/strd/nls/nls_main.shtml
Reference: Thurber, R., NIST (197?).  
Semiconductor electron mobility modeling.

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
  :lib => "CUTEst:THURBER, NIST:Thurber",
)
get_thurber_nvar(; n::Int = default_nvar, kwargs...) = 7
get_thurber_ncon(; n::Int = default_nvar, kwargs...) = 0
get_thurber_nlin(; n::Int = default_nvar, kwargs...) = 0
get_thurber_nnln(; n::Int = default_nvar, kwargs...) = 0
get_thurber_nequ(; n::Int = default_nvar, kwargs...) = 0
get_thurber_nineq(; n::Int = default_nvar, kwargs...) = 0
get_thurber_nls_nequ(; n::Int = default_nvar, kwargs...) = 37
