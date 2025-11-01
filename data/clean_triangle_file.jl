# flatten_turtle_file.jl
# Usage:
#   julia flatten_turtle_file.jl triangle_turtle.jl triangle_turtle_flat.jl

if length(ARGS) < 2
  println("Usage: julia flatten_turtle_file.jl input.jl output.jl")
  exit(1)
end

input_file = ARGS[1]
output_file = ARGS[2]

# Load data in a temporary module
mod = Module(:Tmp)
Base.include(mod, input_file)

# Get the matrices
_TRIS_turtle = getfield(mod, :_TRIS_turtle)
_xe_turtle = getfield(mod, :_xe_turtle)

# Remove the first column
_TRIS_turtle = _TRIS_turtle[:, 2:end]
_xe_turtle = _xe_turtle[:, 2:end]

# Flatten directly into 1-D arrays
TRIS_turtle = vec(_TRIS_turtle)
xe_turtle = vec(_xe_turtle)

# Write new file
open(output_file, "w") do io
  println(io, "# Flattened data extracted from $input_file")
  println(io, "# First column removed; already flat vectors\n")

  println(io, "const TRIS_turtle = ", repr(TRIS_turtle))
  println(io, "const xe_turtle = ", repr(xe_turtle))
end

println("✅ Wrote flattened file to: $output_file")
