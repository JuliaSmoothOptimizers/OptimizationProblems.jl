#!/usr/bin/env julia

# Include the test path like Pkg.test does
using Pkg
const test_dir = joinpath(pwd(), "test")
push!(LOAD_PATH, test_dir)

cd(test_dir) do
    # This mimics what Pkg.test() does
    include("runtests.jl")
end
