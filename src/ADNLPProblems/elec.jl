function elec(;n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}

# Given np electrons, find the equilibrium state distribution of minimal
# Columb potential of the electrons positioned on a conducting sphere

#   This is problem 2 in the COPS (Version 3) collection of 
#   E. Dolan and J. More'
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#   classification OOR2-AN-V-V

    # Define the objective function to minimize

    function f(x)
        v=reshape(x,3,n)'
        elts=pairwise(Euclidean(),v,dims=1)
        return sum(1 ./ elts[tril!(trues(size(elts)), -1)])
    end

    # Define the constraints on these points (sum of the square of the coordinates = 1)
    function c(x)
        C=[]
        for k=0:n-1
            push!(C, x[3k+1]^2 + x[3k+2]^2 + x[3k+3]^2)
        end
        return C
    end

    # bounds on the constraints
    lcon=ucon=(ones(T,n))

    # building a feasible x0
    range0 = zeros(T, n)
    for i=1:n
        range0[i] += i/n
    end

    θ0 = 2π.*range0
    ϕ0 = π.*range0
    xini = [sin(θ0[i])*cos(ϕ0[i]) for i = 1:n] # x coordinate
    yini = [sin(θ0[i])*sin(ϕ0[i]) for i = 1:n] # y coordinate 
    zini = [cos(θ0[i]) for i = 1:n]            # z coordinate
    x0 = zeros(3n)

    for i=0:n-1
        x0[3i+1] += xini[i+1]
        x0[3i+2] += yini[i+1]
        x0[3i+3] += zini[i+1]
    end

    return ADNLPModel(f, x0, c, lcon, ucon, name="elec")
end
