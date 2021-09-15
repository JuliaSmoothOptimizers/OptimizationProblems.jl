module JuMP

using NLPModelsJuMP
import ..PureJuMP

default_nvar = 100

for name in names(PureJuMP)
  name == :PureJuMP && continue
  eval(
    Meta.parse(
      "$(name)(n=$(default_nvar), args... ; kwargs...) = MathOptNLPModel(PureJuMP.$(name)($(default_nvar), args...; kwargs...))",
    ),
  )
end

end
