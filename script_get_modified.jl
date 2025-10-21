using OptimizationProblems, Random

Random.seed!(1234)
n_lim = 200

names_pb_vars = OptimizationProblems.meta[
    OptimizationProblems.meta.variable_nvar .== true,
    [:name]
]
list_of_changing_variables = String[]
for prob in eachrow(names_pb_vars)
    for i=1:n_lim
        n_calc = OptimizationProblems.eval(Symbol(:get_, prob[:name], :_nvar))(n = i)
        if n_calc != i
            push!(list_of_changing_variables, prob[:name])
            break
        end
    end
end


#=
julia> print(list_of_changing_variables)
["NZF1", "bearing", "broydn7d", "catenary", "chain", "chainwoo", "channel", "clnlbeam", "clplatea", "clplateb", "clplatec", "controlinvestment", "dixmaane", "dixmaanf", "dixmaang", "dixmaanh", "dixmaani", "dixmaanj", "dixmaank", "dixmaanl", "dixmaanm", "dixmaann", "dixmaano", "dixmaanp", "elec", "hovercraft1d", "marine", "polygon", "polygon1", "polygon2", "polygon3", "powellsg", "robotarm", "spmsrtls", "structural", "woods"]
=#

nlp = OptimizationProblems.ADNLPProblems.bt1()
function check_obj_allocs(; nlp = nlp)
    x = zeros(2)
    obj(nlp, x)
    return nothing
end
@allocated check_obj_allocs()
@allocated check_obj_allocs()
