gauss2_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "gauss2",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/GAUSS2.SIF",
  :notes => raw"""
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/gauss2.dat

NIST/ITL StRD
Dataset Name:  Gauss2            (Gauss2.dat)

File Format:   ASCII
               Starting Values   (lines 41 to  48)
               Certified Values  (lines 41 to  53)
               Data              (lines 61 to 310)

Procedure:     Nonlinear Least Squares Regression

Description:   The data are two slightly-blended Gaussians on a 
               decaying exponential baseline plus normally 
               distributed zero-mean noise with variance = 6.25. 

Reference:     Rust, B., NIST (1996). 

Data:          1 Response  (y)
               1 Predictor (x)
               250 Observations
               Lower Level of Difficulty
               Generated Data

Model:         Exponential Class
               8 Parameters (b1 to b8)

               y = b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 ) 
                                   + b6*exp( -(x-b7)**2 / b8**2 ) + e
T. Migot, Montreal, 2023.

NIST Data fitting problem GAUSS2 given as an inconsistent set of
nonlinear equations.
Fit: y = b1*exp( -b2*x ) + b3*exp( -(x-b4)**2 / b5**2 )
+ b6*exp( -(x-b7)**2 / b8**2 ) + e

classification NOR2-MN-8-250
""",
  :origin_notes => raw"""
Problem from the NIST nonlinear regression test set
http://www.itl.nist.gov/div898/strd/nls/nls_main.shtml
Reference: Rust, B., NIST (1996).

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
  :lib => "CUTEst:GAUSS2, NIST:Gauss2",
)
get_gauss2_nvar(; n::Int = default_nvar, kwargs...) = 8
get_gauss2_ncon(; n::Int = default_nvar, kwargs...) = 0
get_gauss2_nlin(; n::Int = default_nvar, kwargs...) = 0
get_gauss2_nnln(; n::Int = default_nvar, kwargs...) = 0
get_gauss2_nequ(; n::Int = default_nvar, kwargs...) = 0
get_gauss2_nineq(; n::Int = default_nvar, kwargs...) = 0
get_gauss2_nls_nequ(; n::Int = default_nvar, kwargs...) = 250
