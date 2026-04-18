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
  :url => "",
  :notes => raw"""
# Flow in a Channel

# Analyze the flow of a fluid during injection into a long vertical channel

#   This is problem 7 in the COPS (Version 3) collection of 
#   E. Dolan and J. More'
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#   classification OOR2-AN-V-V
  
""",
  :origin_notes => raw"""""",
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

)
get_channel_nvar(; n::Integer = default_nvar, kwargs...) = 8 * max(2, div(n, 8))
get_channel_ncon(; n::Integer = default_nvar, kwargs...) =
  4 * (max(2, div(n, 8)) - 1) + max(2, div(n, 8)) * 4 + 4
get_channel_nlin(; n::Integer = default_nvar, kwargs...) = (max(2, div(n, 8)) - 1) * 4 + 4
get_channel_nnln(; n::Integer = default_nvar, kwargs...) = max(2, div(n, 8)) * 4
get_channel_nequ(; n::Integer = default_nvar, kwargs...) =
  4 * (max(2, div(n, 8)) - 1) + max(2, div(n, 8)) * 4 + 4
get_channel_nineq(; n::Integer = default_nvar, kwargs...) = 0
