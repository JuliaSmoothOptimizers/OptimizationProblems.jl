function marine(;n::Int = default_nvar, tf=10000, ϵ = 1e-4, type::Val{T} = Val(Float64), kwargs...) where {T}

# Given observations of ns stages of a marine species over n timesteps, 
# minimize the loss between the observation and the computed law of paraneters : growth, mortality and number of specimens (g,m,x) 

    #   This is problem 6 in the COPS (Version 3) collection of 
    #   E. Dolan and J. More'
    #   see "Benchmarking Optimization Software with COPS"
        #   Argonne National Labs Technical Report ANL/MCS-246 (2004)

    #   classification OOR2-AN-V-V

    n > 21 && @warn("marine: number of timesteps must be lower than 21. Solving the problem for n=21:")
    n = min(21, n)
    # parameters of the problem
    dt=tf/n # timestep
    ns = 8 # number of stages
    
    # element i,j gives the number of individuals in stage j at time i
    data=[
    20000.0 17000.0 10000.0 15000.0 12000.0  9000.0  7000.0  3000.0;
    12445.0 15411.0 13040.0 13338.0 13484.0  8426.0  6615.0  4022.0;
    7705.0 13074.0 14623.0 11976.0 12453.0  9272.0  6891.0  5020.0;
    4664.0  8579.0 12434.0 12603.0 11738.0  9710.0  6821.0  5722.0;
    2977.0  7053.0 11219.0 11340.0 13665.0  8534.0  6242.0  5695.0;
    1769.0  5054.0 10065.0 11232.0 12112.0  9600.0  6647.0  7034.0;
    943.0  3907.0  9473.0 10334.0 11115.0  8826.0  6842.0  7348.0;
    581.0  2624.0  7421.0 10297.0 12427.0  8747.0  7199.0  7684.0;
    355.0  1744.0  5369.0  7748.0 10057.0  8698.0  6542.0  7410.0;
    223.0  1272.0  4713.0  6869.0  9564.0  8766.0  6810.0  6961.0;
    137.0   821.0  3451.0  6050.0  8671.0  8291.0  6827.0  7525.0;
    87.0   577.0  2649.0  5454.0  8430.0  7411.0  6423.0  8388.0;
    49.0   337.0  2058.0  4115.0  7435.0  7627.0  6268.0  7189.0;
    32.0   228.0  1440.0  3790.0  6474.0  6658.0  5859.0  7467.0;
    17.0   168.0  1178.0  3087.0  6524.0  5880.0  5562.0  7144.0;
    11.0    99.0   919.0  2596.0  5360.0  5762.0  4480.0  7256.0;
    7.0    65.0   647.0  1873.0  4556.0  5058.0  4944.0  7538.0;
    4.0    44.0   509.0  1571.0  4009.0  4527.0  4233.0  6649.0;
    2.0    27.0   345.0  1227.0  3677.0  4229.0  3805.0  6378.0;
    1.0    20.0   231.0   934.0  3197.0  3695.0  3159.0  6454.0;
    1.0    12.0   198.0   707.0  2562.0  3163.0  3232.0  5566.0
    ]

    cut_data = data[1:n,1:ns]
    data_r=reshape(cut_data,ns*n,1)

    # definition of the objective function
    function f(x::AbstractVector{T}) where T
        return sum((x[i+2ns]-data_r[i])^2 for i = 1:ns*n)
    end

    # definition of constraint function
    function c(x::AbstractVector{T}) where T

        c_1 = x[1:ns] # growth rates < 0
        c_2 = x[1:ns] .+ x[ns+1:2ns] # growth rates + mortality rates < 0

        c_3 = [x[2ns+i+1] - x[2ns+i] - x[2ns+ns*n+i]*dt for i=1:(ns*n-1)]

        c_4 = [x[(ns+n*ns) + (k-1)*n+j] - x[k-1]*x[2ns+(k-2)n+j] + (x[4]+x[ns+k])*x[2ns + (k-1)n+j] for j = 1:n, k= 2:ns]
        C_4 = reshape(c_4, n*(ns-1), 1)
        C= [c_1;
            c_2;
            c_3;
            C_4]

        return C
    end

    # Declaring the bounds on the constraints
    lcon_c1 = -ones(T, ns) .- ϵ
    lcon_c2 = -Inf*ones(T, ns)
    lcon_euler = zeros(T, ns*n-1) .- ϵ
    lcon_rates = zeros(T, n*(ns-1)) .- ϵ
    lcon = [lcon_c1;
            lcon_c2;
            lcon_euler;
            lcon_rates]

    ucon_c1 = zeros(T, ns) .+ ϵ
    ucon_c2 = zeros(T, ns) .+ ϵ
    ucon_euler = zeros(T, ns*n-1) .+ ϵ
    ucon_rates = zeros(T, n*(ns-1)) .+ ϵ
    ucon = [ucon_c1;
            ucon_c2;
            ucon_euler;
            ucon_rates]

    # Initializing x0
    x0=rand(T, 2*ns*n+2ns)*10
    x0[1:ns]=-rand(T, ns)
    x0[ns+1:2ns]= x0[1:ns]/2

    return ADNLPModel(f, x0, c, lcon, ucon, name="marine")
end