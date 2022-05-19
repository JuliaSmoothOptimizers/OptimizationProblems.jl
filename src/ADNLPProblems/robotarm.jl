function robotarm(;N::Int = default_nvar,L = 4.5, ϵ = 1e-4, type::Val{T} = Val(Float64), kwargs...) where {T}

    # Minimize the time taken for a robot arm to travel between two points.

    #  This is problem 8 in the COPS (Version 3) collection of 
    #   E. Dolan and J. More
    #   see "Benchmarking Optimization Software with COPS"
    #   Argonne National Labs Technical Report ANL/MCS-246 (2004)
    
    #  classification OOR2-AN-V-V

    n=N+1 # number of timesteps 
    # x : vector of variables, of the form : [ρ(t=t1); ρ(t=t2); ... ρ(t=tf), θ(t=t1), ..., then ρ_dot, ..., then ρ_acc, .. ϕ_acc, tf]
    # There are N+1 values of each 9 variables 
    # x = [ρ, θ, ϕ, ρ_dot, θ_dot, ϕ_dot, ρ_acc, θ_acc, ϕ_acc, tf]

    # objective function 
    function f(x)
        x[end]
    end

    # constraints function 
    function c(x)
        # position bounds on ρ, θ, ϕ
        c_ρ = x[1:n]
        c_θ = x[n+1:2n]
        c_ϕ = x[2n+1:3n]

        # dynamic bounds on ρ_acc, θ_acc, ϕ_acc
        c_ρ_acc = L*x[6n+1:7n]
        c_θ_acc = x[7n+1:8n] .* ((L .- x[1:n]).^3 .+ x[1:n].^3)/3 .* sin.(x[2n+1:3n]).^2
        c_ϕ_acc = x[8n+1:9n] .* ((L .- x[1:n]).^3 .+ x[1:n].^3)/3

        # tf must be positive
        c_tf = x[end]

        # Euler's constraints 
        c_euler1 = x[2:n] - x[1:n-1] - x[3n+1:4n-1]*x[end]/n
        c_euler2 = x[n+2:2n] - x[n+1:2n-1] - x[4n+1:5n-1]*x[end]/n
        c_euler3 = x[2n+2:3n] - x[2n+1:3n-1] - x[5n+1:6n-1]*x[end]/n
        c_euler4 = x[3n+2:4n] - x[3n+1:4n-1] - x[6n+1:7n-1]*x[end]/n
        c_euler5 = x[4n+2:5n] - x[4n+1:5n-1] - x[7n+1:8n-1]*x[end]/n
        c_euler6 = x[5n+2:6n] - x[5n+1:6n-1] - x[8n+1:9n-1]*x[end]/n
        c_euler = [c_euler1; c_euler2; c_euler3; c_euler4; c_euler5; c_euler6]

        # constraints on initial and final values 
        c_0_f = [x[1]; x[n]; x[n+1]; x[2n]; x[2n+1]; x[3n]; x[3n+1]; x[4n]; x[4n+1]; x[5n]; x[5n+1]; x[6n]; x[6n+1]; x[7n]; x[7n+1]; x[8n]; x[8n+1]; x[9n]]

        return [c_ρ; c_θ; c_ϕ; c_ρ_acc; c_θ_acc; c_ϕ_acc; c_tf; c_euler; c_0_f]
    end

    lcon = T[zeros(n);
            -π*ones(n);
            zeros(n);
            -ones(n);
            -ones(n);
            -ones(n);
            0;
            zeros(6N) .- ϵ;
            L; L; 0; 2π/3; π/4; π/4; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0]

    ucon = T[L*ones(n);
            π*ones(n);
            π*ones(n);
            ones(n);
            ones(n);
            ones(n);
            +Inf;
            zeros(6N) .+ ϵ;
            L; L; 0; 2π/3; π/4; π/4; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0]

    # Building a feasible x0
    tf0=T(1)
    x0 = [L*ones(T, n); rand(T,n); π/4*ones(T, n); zeros(T, 6n); tf0]
    θ0 = T[2π/3*(t/n)^2 for t in 1:n]
    x0[n+1:2n] = θ0
    x0[n+1] = T(0)

    return ADNLPModel(f, x0, c, lcon, ucon, name="robotarm")
end