misra1c_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "misra1c",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/MISRA1C.SIF",
  :notes => raw"""
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/misra1c.dat

NIST/ITL StRD
Dataset Name:  Misra1c           (Misra1c.dat)

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
               Dental Research Monomolecular Adsorption.

Data:          1 Response  (y = volume)
               1 Predictor (x = pressure)
               14 Observations
               Average Level of Difficulty
               Observed Data

Model:         Miscellaneous Class
               2 Parameters (b1 and b2)

               y = b1 * (1-(1+2*b2*x)**(-.5))  +  e
T. Migot, Montreal, 2023.

NIST Data fitting problem MISRA1C given as an inconsistent set of
nonlinear equations.
Fit: y = b1 * (1-(1+2*b2*x)**(-.5)) + e

classification NOR2-MN-2-14
""",
  :origin_notes => raw"""
Problem from the NIST nonlinear regression test set
http://www.itl.nist.gov/div898/strd/nls/nls_main.shtml
Reference: Misra, D., NIST (1978).  
Dental Research Monomolecular Adsorption Study.

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
  :lib => "CUTEst:MISRA1C, NIST:Misra1c",
)
get_misra1c_nvar(; n::Int = default_nvar, kwargs...) = 2
get_misra1c_ncon(; n::Int = default_nvar, kwargs...) = 0
get_misra1c_nlin(; n::Int = default_nvar, kwargs...) = 0
get_misra1c_nnln(; n::Int = default_nvar, kwargs...) = 0
get_misra1c_nequ(; n::Int = default_nvar, kwargs...) = 0
get_misra1c_nineq(; n::Int = default_nvar, kwargs...) = 0
get_misra1c_nls_nequ(; n::Int = default_nvar, kwargs...) = 14
