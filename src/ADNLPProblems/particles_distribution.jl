using ADNLPModels, LinearAlgebra, Distances, SolverCore
function particles_distribution(;n::Int = 20, type::Val{T} = Val(Float64), kwargs...) where {T}

    N=n
    # Define the objective function to minimize
    function objective(x)
        v=reshape(x,3,N)'
        elts=pairwise(Euclidean(),v,dims=1)
        u_elts=[]
        for i=2:N-1
            for j=i+1:N
                push!(u_elts,1/elts[i,j])
            end
        end
        s=sum(u_elts)
        return(s)
    end


    # Define the constraints on these points (sum of the square of the coordinates = 1)
    function constraints(x)
        c=[]
        for k=0:N-1
            push!(c, x[3k+1]^2 + x[3k+2]^2 + x[3k+3]^2)
        end
        return c
    end


    # Solving the problem

    lcon=ucon=(ones(T,N))
    z0=rand(T,N*3)

    return ADNLPModel(objective, z0, constraints, lcon, ucon, name="particles distribution on a sphere")
end