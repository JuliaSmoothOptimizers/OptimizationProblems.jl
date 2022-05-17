particles_distribution_meta = Dict(
    :nvar => 300,  
    :variable_nvar => true,  
    :ncon => 100,
    :variable_ncon => true,  
    :minimize => true,
    :name => "particles_distribution",
    :has_equalities_only => true,
    :has_inequalities_only => false,
    :has_bounds => false,
    " ⋯ 451 bytes ⋯ "ult_nvar, kwargs...) = 0
    get_particles_distribution_nnln(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
    get_particles_distribution_nequ(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
    get_particles_distribution_nineq(; n::Integer = default_nvar, kwargs...) = 0
