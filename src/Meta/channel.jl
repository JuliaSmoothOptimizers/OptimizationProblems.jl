channel_meta = Dict(
  :nvar => 96,
  :variable_nvar => true,
  :ncon => 96,
  :variable_ncon => true,
  :minimize => true,
  :name => "channel",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/CHANNEL.SIF",
  :notes => raw"""
Flow in a Channel

Analyse the flow of a fluid during injection into a long vertical channel,
assuming that the flow is modelled by the boundary-value problem
u'''' = R (u'u'' - u u''') t in [0,1]
u(0) = 0, u(1) = 1, u'(0) = 0 = u'(1)
where u is the potential function, u' is the tangential velocity of
the field, and R is the Reynold's number

classification NOR2-AN-V-V
""",
  :origin_notes => raw"""
This is problem 7 in the COPS (Version 3) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2004)

SIF input: Nick Gould, November 2000
""",
  :reference => raw"""
@techreport{DolanMore2004COPS,
  author       = {Dolan, Elizabeth D. and Mor{'e}, Jorge J.},
  title        = {Benchmarking Optimization Software with {COPS} 3.0},
  institution  = {Argonne National Laboratory},
  number       = {ANL/MCS-TM-273},
    year         = {2004},
  doi          = {10.2172/834714}
  }
    """,
  :lib => "CUTEst:CHANNEL, COPS:7",
)
get_channel_nvar(; n::Integer = default_nvar, kwargs...) = 8 * max(2, div(n, 8))
get_channel_ncon(; n::Integer = default_nvar, kwargs...) =
  4 * (max(2, div(n, 8)) - 1) + max(2, div(n, 8)) * 4 + 4
get_channel_nlin(; n::Integer = default_nvar, kwargs...) = (max(2, div(n, 8)) - 1) * 4 + 4
get_channel_nnln(; n::Integer = default_nvar, kwargs...) = max(2, div(n, 8)) * 4
get_channel_nequ(; n::Integer = default_nvar, kwargs...) =
  4 * (max(2, div(n, 8)) - 1) + max(2, div(n, 8)) * 4 + 4
get_channel_nineq(; n::Integer = default_nvar, kwargs...) = 0
