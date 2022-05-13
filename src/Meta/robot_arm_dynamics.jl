robot_arm_dynamics_meta = Dict(
      :nvar => 910,
        :variable_nvar => true,
          :ncon => 1225,
            :variable_ncon => true,
              :minimize => true,
                :name => "robot_arm_dynamics",
                  :has_equalities_only => false,
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
                                      )
                                      get_robot_arm_dynamics_nvar(; n::Integer = default_nvar, kwargs...) = 9 * n + 10
                                      get_robot_arm_dynamics_ncon(; n::Integer = default_nvar, kwargs...) = 12 * n + 25
                                      get_robot_arm_dynamics_nlin(; n::Integer = default_nvar, kwargs...) = 0
                                      get_robot_arm_dynamics_nnln(; n::Integer = default_nvar, kwargs...) = 12 * n + 25
                                      get_robot_arm_dynamics_nequ(; n::Integer = default_nvar, kwargs...) = 18
                                      get_robot_arm_dynamics_nineq(; n::Integer = default_nvar, kwargs...) = 12 * n + 7