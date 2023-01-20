using Pkg
if isfile("Project.toml") && isfile("Manifest.toml")
    Pkg.activate(".")
end

try
    @eval using Revise
catch e
    @warn "Error initializing Revise"
end
