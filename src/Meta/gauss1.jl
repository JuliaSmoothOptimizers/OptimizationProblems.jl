gauss1_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "gauss1",
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
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/gauss1.dat

NIST/ITL StRD
Dataset Name:  Gauss1            (Gauss1.dat)

File Format:   ASCII
               Starting Values   (lines 41 to  48)
               Certified Values  (lines 41 to  53)
               Data              (lines 61 to 310)

Procedure:     Nonlinear Least Squares Regression

Description:   The data are two well-separated Gaussians on a 
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
                                   """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_gauss1_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_gauss1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_gauss1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_gauss1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_gauss1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_gauss1_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_gauss1_nls_nequ(; n::Integer = default_nvar, kwargs...) = 250
