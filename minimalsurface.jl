using Plots
using ADNLPModels, NLPModels, NLPModelsIpopt, DataFrames, LinearAlgebra, Distances, SolverCore, PyPlot

function minimalsurface(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
    
    # domain definition
    xmin = T(0.)
    xmax = T(1.)
    ymin = T(0.)
    ymax = T(1.)

    # Definition of the mesh
    nx = T(20) # number of points according to the direction x
    ny = T(20) # number of points according to the direction y


    x_mesh = T(LinRange(xmin, xmax, nx)) # coordinates of the mesh points x
    y_mesh = T(LinRange(ymin, ymax, ny)) # coordinates of the mesh points y

    v_D = zeros(nx,ny) # Surface matrix initialization
    for i in 1:nx
        for j in 1:ny
            v_D[i, j] = T(1 - (2 * x_mesh[i] - 1)^2)
        end 
    end  


    function Objective(v)
        v_reshape = reshape(v, (nx, ny)) # vector to matrix conversion
        hx = T(1/nx)  # step on the x axis
        hy = T(1/ny)  # step on the y axis
        S = T(0.) # sum initialization
        # Calculation of the gradient according to x
        for i in 1:nx
            for j in 1:ny
                if i == 1
                    gi = T((v_reshape[i+1, j] - v_reshape[i, j])/hx)
                elseif i == nx
                    gi = T((v_reshape[i, j] - v_reshape[i-1, j])/hx)
                else 
                    gi = T((v_reshape[i+1, j] - v_reshape[i, j])/(2 * hx))
                end 
        # Calculation of the gradient according to x
                if j == 1
                    gj = T((v_reshape[i, j+1] - v_reshape[i, j])/hy)            
                elseif j == ny
                    gj = T((v_reshape[i, j] - v_reshape[i, j-1])/hy) 
                else 
                    gj = T((v_reshape[i, j+1] - v_reshape[i, j])/(2 * hy)) 
                end 

                s = T(hx * hy * (sqrt(1 + (gi^2) +(gj)^2))) # Approximation of the derivative with the method of rectangles
                S = S + s # Update the value of S
            end
        end
        return(S)
    end 

    function constraints(v)
        v_reshape = reshape(v, (nx, ny)) # vector to matrix conversion
        c = similar(v_reshape, nx*ny + 2*(nx +ny)) # creating a constraint vector
        index = 1
        v_L = zeros(T, nx,ny) # Creation of an obstacle called v_L
        for i in 1:nx
            for j in 1:ny
                if norm(x_mesh[i]-(1/2)) ≤ 1/4 && norm(y_mesh[j]-(1/2)) ≤ 1/4
                    v_L[i, j] = T(1.) # Update the value of v_L according to the values ​​of x and y
                end
            end 
        end  
        for i in 1:nx
            for j in 1:ny
                c[index] = T(v_reshape[i, j] - v_L[i, j]) # Constraint that the surface must be above the obstruction
                index = index + 1
            end 
        end 
        for j in 1:ny
            c[index] = T(v_reshape[1, j]) # Constraint: when x=1 or x=nx, the surface is set to 0
            index = index + 1
            c[index] =  T(v_reshape[nx, j]) # Constraint: when x=1 or x=nx, the surface is set to 0
            index = index + 1
        end 
        for i in 1:nx
            c[index] = T(v_reshape[i, 1] - 1 + (2 * i -1)^2) # Constraint: when y=1 or y=ny, the surface follows the function " 1 + (2 * x -1)^2 "
            index = index + 1
            c[index] = T(v_reshape[i, ny] - 1 + (2 * i -1)^2) # Constraint: when y=1 or y=ny, the surface follows the function " 1 + (2 * x -1)^2 "
            index = index + 1

        end 
        return c
    end


    lcon = zeros(T, nx * ny + 2 * nx + 2 * ny) # Lower bound all equal to 0
    ucon = zeros(T, nx * ny + 2 * nx + 2 * ny) # Creation of the upper bound vector
    ucon[1 : ny * nx] = Inf * ones(T, nx * ny) # first part equal to infinity
    ucon[nx * ny + 1 : end] = zeros(T, 2 * nx + 2 * ny) # second part part equal to zero

    v = vec(v_D) #convert to vector

    nlp = ADNLPModel(Objective, v, constraints, lcon, ucon)
    return nlp
end 


