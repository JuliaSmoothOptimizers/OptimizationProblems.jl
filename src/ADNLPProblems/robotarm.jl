export robotarm

# Minimize the time taken for a robot arm to travel between two points.

    #  This is problem 8 in the COPS (Version 3) collection of 
    #   E. Dolan and J. More
    #   see "Benchmarking Optimization Software with COPS"
    #   Argonne National Labs Technical Report ANL/MCS-246 (2004)
    
    #  classification OOR2-AN-V-V

function robotarm(;n::Int = default_nvar,L = 4.5, type::Val{T} = Val(Float64), kwargs...) where {T}

    N = max(2, div(n, 9))
    n = N + 1
    L=T(L)

    # x : vector of variables, of the form : [ρ(t=t1); ρ(t=t2); ... ρ(t=tf), θ(t=t1), ..., then ρ_dot, ..., then ρ_acc, .. ϕ_acc, tf]
    # There are N+1 values of each 9 variables 
    # x = [ρ, θ, ϕ, ρ_dot, θ_dot, ϕ_dot, ρ_acc, θ_acc, ϕ_acc, tf]

    # objective function 
    function f(x)
        x[end]
    end

    # constraints function 
    function c(x)

        # dynamic bounds on ρ_acc, θ_acc, ϕ_acc
        c_ρ_acc = L*x[6n+1:7n]
        c_θ_acc = x[7n+1:8n] .* ((L .- x[1:n]).^3 .+ x[1:n].^3)/3 .* sin.(x[2n+1:3n]).^2
        c_ϕ_acc = x[8n+1:9n] .* ((L .- x[1:n]).^3 .+ x[1:n].^3)/3

        # Euler's constraints 
        c_euler1 = x[2:n] - x[1:n-1] - x[3n+1:4n-1]*x[end]/n
        c_euler2 = x[n+2:2n] - x[n+1:2n-1] - x[4n+1:5n-1]*x[end]/n
        c_euler3 = x[2n+2:3n] - x[2n+1:3n-1] - x[5n+1:6n-1]*x[end]/n
        c_euler4 = x[3n+2:4n] - x[3n+1:4n-1] - x[6n+1:7n-1]*x[end]/n
        c_euler5 = x[4n+2:5n] - x[4n+1:5n-1] - x[7n+1:8n-1]*x[end]/n
        c_euler6 = x[5n+2:6n] - x[5n+1:6n-1] - x[8n+1:9n-1]*x[end]/n
        c_euler = [c_euler1; c_euler2; c_euler3; c_euler4; c_euler5; c_euler6]

        return [c_ρ_acc; c_θ_acc; c_ϕ_acc; c_euler]
    end

    lcon = T[-ones(n);
            -ones(n);
            -ones(n);
            zeros(6N)]

    ucon = T[ones(n);
            ones(n);
            ones(n);
            zeros(6N)]

    # Building a feasible x0
    tf0=T(1)
    θ0 = T[2π/3*(t/n)^2 for t in 1:n]
    θ0[1]=T(0)
    x0 = [L*ones(T, n); θ0; π*ones(T, n)/4; zeros(T, 6n); tf0]


    # defining the bounds on the variables
    lvar = T[zeros(n); -π*ones(n); zeros(n) ; -Inf*ones(6n); 0]
    uvar = T[L*ones(n); π*ones(n); 2π*ones(n) ; Inf*ones(6n); Inf]
    lvar[1] = uvar[1] = lvar[n] = uvar[n] = T(L)
    lvar[n+1] = uvar[n+1] = T(0)
    lvar[2n] = uvar[2n] = T(2*π/3)
    lvar[2n+1] = uvar[2n+1] = lvar[3n] = uvar[3n] = T(π/4)
    lvar[3n+1] = uvar[3n+1] = lvar[4n] = uvar[4n] = lvar[4n+1] = uvar[4n+1] = lvar[5n] = uvar[5n] = lvar[5n+1] = uvar[5n+1] = lvar[6n] = uvar[6n] = lvar[6n+1] = uvar[6n+1] = lvar[7n] = uvar[7n] = lvar[7n+1] = uvar[7n+1] = lvar[8n] = uvar[8n] = lvar[8n+1] = uvar[8n+1] = lvar[9n] = uvar[9n] = T(0)



    return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name="robotarm"; kwargs...)
end