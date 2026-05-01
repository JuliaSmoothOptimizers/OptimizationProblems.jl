lanczos1_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "lanczos1",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/LANCZOS1.SIF",
  :notes => raw"""
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/lanczos1.dat

NIST/ITL StRD
Dataset Name:  lanczos1           (lanczos1.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 42)
               Certified Values  (lines 41 to 47)
               Data              (lines 61 to 74)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study regarding
               dental research in monomolecular adsorption.  The
               response variable is volume, and the predictor
               variable is pressure.

Reference:     Misra, D., NIST (1978).  
               Dental Research Monomolecular Adsorption Study.

Data:          1 Response Variable  (y = volume)
               1 Predictor Variable (x = pressure)
               14 Observations
               Lower Level of Difficulty
               Observed Data

Model:         Exponential Class
               2 Parameters (b1 and b2)

               y = b1*(1-exp[-b2*x])  +  e
T. Migot, Montreal, 2023.
               """,
  :origin_notes => raw"""
Problem :
NIST Data fitting problem LANCZOS1 given as an inconsistent set of
nonlinear equations.
Fit: y = b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x) + e
Source:  Problem from the NIST nonlinear regression test set
http://www.itl.nist.gov/div898/strd/nls/nls_main.shtml
Reference: Lanczos, C. (1956).
Applied Analysis. Englewood Cliffs, NJ:  Prentice Hall, pp. 272-280.
SIF input: Nick Gould and Tyrone Rees, Oct 2015
classification NOR2-MN-6-24
""",
  :reference => raw"""""",
  :lib => "CUTEst:LANCZOS1, NIST:lanczos1",
)
get_lanczos1_nvar(; n::Integer = default_nvar, kwargs...) = 6
get_lanczos1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_lanczos1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_lanczos1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_lanczos1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_lanczos1_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_lanczos1_nls_nequ(; n::Integer = default_nvar, kwargs...) = 24
