genrose_nash_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "genrose_nash",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 404.12622137598714,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Generalized Rosenbrock function.

Source: problem 4 in
S. Nash,
Newton-type minimization via the Lanczos process,
SIAM J. Num. Anal. 21, 770-788, 1984,

and

problem 36 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

classification SUR2-AN-V-0

Note: this variant does not reduce to the classical
Rosenbrock function when n = 2, described in

H. H. Rosenbrock,
An automatic method for finding the greatest or least value
of a function
The Computer Journal 3: 175–184, 1960.
https://dx.doi.org/10.1093%2Fcomjnl%2F3.3.175

D. Orban, Montreal, 08/2015.

 
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   classification SUR2-AN-V-0
#
# D. Orban, Montreal, 08/2015.

# Note: difference from CUTEst is due to the constant 1.0,
# which does not affect its utility as a test problem other than perhaps
# for convergence-testing.

# Difference with the following is the initial guess.
#
#   Problem 1 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Sparse Test Problems for Unconstrained Optimization,
#   Technical Report 1064,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
#
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_genrose_nash_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_genrose_nash_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nash_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nash_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nash_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nash_nineq(; n::Integer = default_nvar, kwargs...) = 0
