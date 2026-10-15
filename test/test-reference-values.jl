# Values that a problem must reproduce, taken from the problem's published source. They check
# the formulation itself, where the other tests check that this package's implementations of a
# problem agree with each other.
#
# Each file `reference-values/<problem>.jl` cites its source and evaluates to a vector of named
# tuples, one per point, with the fields
#
#   - `kwargs`: keyword arguments passed to the problem constructor (default: none)
#   - `x0`: expected starting point
#   - `x`: point at which the following are evaluated
#   - `obj`: expected objective value at `x`
#   - `residual_sum_of_squares`: expected sum of squared residuals at `x`, computed from the
#     model returned with `use_nls = true`
#   - `max_violation`: upper bound on the constraint violation at `x`
#   - `atol`, `rtol`: tolerances for `x0`, `obj` and `residual_sum_of_squares`; at least one is
#     required
#
# All fields except the tolerances are optional. Every implementation of the problem is checked.

const reference_values_dir = joinpath(@__DIR__, "reference-values")

const reference_value_fields =
  (:kwargs, :x0, :x, :obj, :residual_sum_of_squares, :max_violation, :atol, :rtol)

function constraint_violation(nlp::AbstractNLPModel, x)
  c = cons(nlp, x)
  return maximum(max.(get_lcon(nlp) .- c, c .- get_ucon(nlp), 0); init = zero(eltype(c)))
end

function test_reference_values(prob::Symbol, ref::NamedTuple)
  unknown = setdiff(keys(ref), reference_value_fields)
  isempty(unknown) || error("reference values for $prob: unknown fields $unknown")
  haskey(ref, :atol) ||
    haskey(ref, :rtol) ||
    error("reference values for $prob: give `atol` or `rtol`")
  tol = (atol = get(ref, :atol, 0), rtol = get(ref, :rtol, 0))
  kwargs = get(ref, :kwargs, NamedTuple())
  x = haskey(ref, :x) ? float.(ref.x) : nothing

  models = AbstractNLPModel[]
  isdefined(ADNLPProblems, prob) && push!(models, make_ad_nlp(prob; kwargs...))
  isdefined(PureJuMP, prob) && push!(models, make_jump_nlp(prob; kwargs...))
  for nlp in models
    haskey(ref, :x0) && @test isapprox(get_x0(nlp), ref.x0; tol...)
    haskey(ref, :obj) && @test isapprox(obj(nlp, x), ref.obj; tol...)
    haskey(ref, :max_violation) && @test constraint_violation(nlp, x) <= ref.max_violation
  end
  if haskey(ref, :residual_sum_of_squares)
    nls = make_ad_nlp(prob; use_nls = true, kwargs...)
    @test isapprox(sum(abs2, residual(nls, x)), ref.residual_sum_of_squares; tol...)
  end
end

@testset "Reference values" begin
  for file in readdir(reference_values_dir)
    name, ext = splitext(file)
    ext == ".jl" || error("$(joinpath(reference_values_dir, file)) is not a Julia file")
    prob = Symbol(name)
    prob in list_problems || error("$file does not name a problem")
    @testset "$prob" begin
      for ref in include(joinpath(reference_values_dir, file))
        test_reference_values(prob, ref)
      end
    end
  end
end
