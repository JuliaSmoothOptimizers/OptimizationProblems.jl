using ADNLPModels, LinearAlgebra, Distances, SolverCore
function particles_distribution(;n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}

    # Define the objective function to minimize
    function objective(x)
        v=reshape(x,n,3)
        elts=pairwise(Euclidean(),v,dims=1)
        s = 0
        for i=2:n-1
            for j=i+1:n
                s += 1/elts[i,j]
            end
        end
        return(s)
    end

    # Define the constraints on these points (sum of the square of the coordinates = 1)
    function constraints(x)
        c=[]
        for k=0:n-1
            push!(c, x[3k+1]^2 + x[3k+2]^2 + x[3k+3]^2)
        end
        return c
    end


    # Solving the problem

    lcon=ucon=(ones(T,n))
    x0=rand(T,n*3)

    return ADNLPModel(objective, x0, constraints, lcon, ucon, name="particles distribution on a sphere")
end