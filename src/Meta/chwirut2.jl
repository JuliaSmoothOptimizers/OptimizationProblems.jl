chwirut2_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "chwirut2",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/CHWIRUT2.SIF",
  :notes => raw"""
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/chwirut2.dat

NIST/ITL StRD
Dataset Name:  Chwirut2          (Chwirut2.dat)

File Format:   ASCII
               Starting Values   (lines 41 to  43)
               Certified Values  (lines 41 to  48)
               Data              (lines 61 to 114)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study involving
               ultrasonic calibration.  The response variable is
               ultrasonic response, and the predictor variable is
               metal distance.

Reference:     Chwirut, D., NIST (197?).  
               Ultrasonic Reference Block Study. 

Data:          1 Response  (y = ultrasonic response)
               1 Predictor (x = metal distance)
               54 Observations
               Lower Level of Difficulty
               Observed Data

Model:         Exponential Class
               3 Parameters (b1 to b3)

               y = exp(-b1*x)/(b2+b3*x)  +  e
T. Migot, Montreal, 2023.

NIST Data fitting problem CHWIRUT2 given as an inconsistent set of
nonlinear equations.
Fit: y = exp[-b1*x]/(b2+b3*x) + e

classification NOR2-MN-3-54
""",
  :origin_notes => raw"""
Problem from the NIST nonlinear regression test set
http://www.itl.nist.gov/div898/strd/nls/nls_main.shtml
Reference: Chwirut, D., NIST (197?).  
Ultrasonic Reference Block Study.

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
  :lib => "CUTEst:CHWIRUT2, NIST:Chwirut2",
)
get_chwirut2_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_chwirut2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_chwirut2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_chwirut2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_chwirut2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_chwirut2_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_chwirut2_nls_nequ(; n::Integer = default_nvar, kwargs...) = 54
