watson_meta = Dict(
  :nvar => 31,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "watson",
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

   Watson problem in varaible dimension ( 2 <= n <= 31 ).
   This function is a nonlinear least squares with 31 groups. 

   Source:  problem 20 in
      J.J. More', B.S. Garbow and K.E. Hillstrom,
      "Testing Unconstrained Optimization Software",
      ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
   Also problem 128 (p. 100) in 
      A.R. Buckley,
      "Test functions for unconstrained minimization",
      TR 1989CS-3, Mathematics, statistics and computing centre,
      Dalhousie University, Halifax (CDN), 1989.

   SUR2-AN-V-0  
  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_watson_nvar(; n::Integer = default_nvar, kwargs...) = min(max(n, 2), 31)
get_watson_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_watson_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_watson_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_watson_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_watson_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_watson_nls_nequ(; n::Integer = default_nvar, kwargs...) = 31
