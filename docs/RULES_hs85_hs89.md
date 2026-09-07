# OptimizationProblems.jl Rules — HS85 & HS89 Example

This table doubles as the specification for `docs/check_rules.jl`: every row with a
`✓` in "Automated" is checked by that script (`julia --project=docs docs/check_rules.jl
<problem>...`); everything else needs a human reviewer.

| Rule | Automated | HS85 | HS89 | How to Check |
|------|:---:|------|------|--------------|
| File Structure | ✓ | src/ADNLPProblems/hs85.jl, src/PureJuMP/hs85.jl, src/Meta/hs85.jl | src/ADNLPProblems/hs89.jl, src/PureJuMP/hs89.jl, src/Meta/hs89.jl | Check for all three files per problem |
| Header | ✓ | Source reference in the PureJuMP file header | Same | Parse header comments for a "Source" line |
| Mathematical Expressions | | All intermediates, constraints, objective explicit, match paper | Same | Compare expressions to paper and extracted JSON |
| Variable Bounds | ✓ | Explicit bounds and x0 in ADNLP (unless `:has_bounds => false`) | Same | Check for `lvar`/`uvar`/`x0` in the ADNLP file |
| Metadata | ✓ | `:name`, `:best_known_upper_bound`, and all of `get_hs85_{nvar,ncon,nlin,nnln,nequ,nineq}` in Meta file | Same | Parse Meta file for required fields and getters |
| Naming | ✓ (via File Structure) | hs85.jl in ADNLPProblems, hs85.jl in PureJuMP, hs85.jl in Meta | hs89.jl in ADNLPProblems, hs89.jl in PureJuMP, hs89.jl in Meta | Check file/function names against repository conventions |
| JuMP Interface Consistency | ✓ | PureJuMP file uses only the modern interface (`@objective`/`@constraint`/`@expression`), never mixed with `@NLobjective`/`@NLconstraint`/`@NLexpression` | Same | Grep for `@NL*` macros in the PureJuMP file — JuMP refuses to build a model mixing both, so this crashes `MathOptNLPModel` |
| AD-Generic Signatures | ✓ | ADNLPProblems objective/constraint closures are not typed to a concrete `x::AbstractVector{T}` | Same | Grep the ADNLP file for `::AbstractVector{T}` argument annotations — these silently block ForwardDiff |
| ADNLP/PureJuMP Compatibility | ✓ | `nvar`, `x0`, `ncon`, objective, `cons()`, `lcon`/`ucon`, and `lin` agree between the two formulations at `x0` | Same | Instantiate both models and compare (this is `test/test-utils.jl`'s `test_compatibility`, run early) |
| Allocation | ✓ (informational) | `cons_nln!` allocation count reported | Same | Run `cons_nln!` twice and check `@allocated` is 0 |
| Ipopt Solve | manual | Problem solves with Ipopt (PureJuMP) | Same | Run Ipopt solver and check for solution |
| Reviewer Markdown | ✓ (presence only) | Summary, PDF screenshot, extraction uncertainties, test results | Same | Generate reviewer markdown file |
| Duplication | | No duplicate (by name, structure, metadata) | Same | Check for similar names/metadata |
| Traceability | ✓ (via Header) | Origin clear and referenced in header/Meta | Same | Check Meta/header |
| Scalability | | Marked if scalable (not for hs85/hs89) | Same | Check Meta/implementation |
| Multiple Problems | | One PDF = one problem (for hs85/hs89) | Same | Allow multiple if needed |
| Uncertainty | | Warn if extraction unclear (not for hs85/hs89) | Same | Parse extraction JSON for uncertainties |

---

This table is tailored to HS85 and HS89, but the automated rows and
`docs/check_rules.jl` are written to run on any problem name. 
They were used as-is to catch a JuMP-model-construction crash, a ForwardDiff-breaking type annotation, and a full constraint-by-constraint ADNLP/PureJuMP mismatch in this
PR before merge. Use this table as a checklist for similar problems and PRs.
