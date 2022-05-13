using ADNLPModels

function robot_arm_dynamics(;n::Int = 30,L = 4.5, ϵ = 1e-4, type::Val{T} = Val(Float64), kwargs...) where {T}
N = n
    n=N+1 # number of timesteps 
    ϵ = 1e-4
    # X : vector of variables, of the form : [ρ(t=t1); ρ(t=t2); ... ρ(t=tf), θ(t=t1), ..., then ρ_dot, ..., then ρ_acc, .. ϕ_acc, tf]
    # There are N+1 values of each 9 variables 
    # X = [ρ, θ, ϕ, ρ_dot, θ_dot, ϕ_dot, ρ_acc, θ_acc, ϕ_acc, tf]


    # objective function 
    function objective(X)
        X[end]
    end


    # constraints function 
    function c(X)

        # position bounds on ρ, θ, ϕ
        c_ρ = X[1:n]
        c_θ = X[n+1:2n]
        c_ϕ = X[2n+1:3n]


        # dynamic bounds on ρ_acc, θ_acc, ϕ_acc
        c_ρ_acc = L*X[6n+1:7n]
        c_θ_acc = similar(X,n)
        c_ϕ_acc = similar(X,n)
        for m=1:n
            c_θ_acc[m] = X[7n+m] * ((L - X[m])^3 + X[m]^3)/3 * sin(X[2n+m])^2 
            c_ϕ_acc[m] = X[8n+m] * ((L - X[m])^3 + X[m]^3)/3 
        end


        # tf must be positive
        c_tf = X[end]

        # Euler's constraints 
        c_euler = similar(X, 6N)
        c_euler[1:N] = X[2:n] - X[1:n-1] - X[3n+1:4n-1]*X[end]/n
        c_euler[N+1:2N] = X[n+2:2n] - X[n+1:2n-1] - X[4n+1:5n-1]*X[end]/n
        c_euler[2N+1:3N] = X[2n+2:3n] - X[2n+1:3n-1] - X[5n+1:6n-1]*X[end]/n
        c_euler[3N+1:4N] = X[3n+2:4n] - X[3n+1:4n-1] - X[6n+1:7n-1]*X[end]/n
        c_euler[4N+1:5N] = X[4n+2:5n] - X[4n+1:5n-1] - X[7n+1:8n-1]*X[end]/n
        c_euler[5N+1:6N] = X[5n+2:6n] - X[5n+1:6n-1] - X[8n+1:9n-1]*X[end]/n

        # constraints on initial and final values 
        c_0_f = [X[1]; X[n]; X[n+1]; X[2n]; X[2n+1]; X[3n]; X[3n+1]; X[4n]; X[4n+1]; X[5n]; X[5n+1]; X[6n]; X[6n+1]; X[7n]; X[7n+1]; X[8n]; X[8n+1]; X[9n]]

        C = [c_ρ; c_θ; c_ϕ; c_ρ_acc; c_θ_acc; c_ϕ_acc; c_tf; c_euler; c_0_f]

        return C
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


    # Building a feasible X0
    tf0=T(1)
    X0 = [L*ones(T, n); rand(T,n); π/4*ones(T, n); zeros(T, 6n); tf0]
    θ0 = T[2π/3*(t/n)^2 for t in 1:n]
    X0[n+1:2n] = θ0
    X0[n+1] = T(0)

    return ADNLPModel(objective, X0, c, lcon, ucon)
end