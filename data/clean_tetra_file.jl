# Usage:
#   julia clean_tetra_file.jl tetra_hook.jl tetra_hook_clean.jl

if length(ARGS) < 2
  println("Usage: julia flatten_hook_file.jl input.jl output.jl")
  exit(1)
end

input_file = ARGS[1]
output_file = ARGS[2]

# Load data in a temporary module
mod = Module(:Tmp)
Base.include(mod, input_file)

# Get the matrices
_TETS_hook = getfield(mod, :_TETS_hook)
_xe_hook = getfield(mod, :_xe_hook)

# Remove the first column
_TETS_hook = _TETS_hook[:, 2:end]
_xe_hook = _xe_hook[:, 2:end]

# Flatten directly into 1-D arrays
TETS_hook = vec(_TETS_hook)
xe_hook = vec(_xe_hook)

# Write new file
open(output_file, "w") do io
  println(io, "# Flattened data extracted from $input_file")
  println(io, "# First column removed; already flat vectors\n")

  println(io, "const TETS_hook = ", repr(TETS_hook))
  println(io, "const xe_hook = ", repr(xe_hook))
end

println("✅ Wrote flattened file to: $output_file")
