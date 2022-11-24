using JLD2

include("tetra_duct12.jl")
@save "data_tetra_duct12.jld2" xe_duct12 TETS_duct12 Const_duct12

include("tetra_duct15.jl")
@save "data_tetra_duct15.jld2" xe_duct15 TETS_duct15 Const_duct15

include("tetra_duct20.jl")
@save "data_tetra_duct20.jld2" xe_duct20 TETS_duct20 Const_duct20

include("tetra_foam5.jl")
@save "data_tetra_foam5.jld2" xe_foam5 TETS_foam5 Const_foam5

include("tetra_gear.jl")
@save "data_tetra_gear.jld2" xe_gear TETS_gear Const_gear

include("tetra_hook.jl")
@save "data_tetra_hook.jld2" xe_hook TETS_hook Const_hook

include("tetra.jl")
@save "data_tetra.jld2" xe_tetra Tets_tetra Constants_tetra

include("triangle.jl")
@save "data_triangle.jld2" xe Tr Constants

include("triangle_deer.jl")
@save "data_triangle_deer.jld2" xe_deer TRIS_deer Const_deer

include("triangle_pacman.jl")
@save "data_triangle_pacman.jld2" xe_pacman TRIS_pacman Const_pacman

include("triangle_turtle.jl")
@save "data_triangle_turtle.jld2" xe_turtle TRIS_turtle Const_turtle
