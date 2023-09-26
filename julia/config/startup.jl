using Pkg
if isfile("Project.toml") && isfile("Manifest.toml")
    Pkg.activate(".")
end

try
    @eval using Revise
catch e
    @warn "Error initializing Revise"
end

function restart()
    startup = """
        Base.ACTIVE_PROJECT[]=$(repr(Base.ACTIVE_PROJECT[]))
        Base.HOME_PROJECT[]=$(repr(Base.HOME_PROJECT[]))
        cd($(repr(pwd())))
        """
    cmd = `$(Base.julia_cmd()) -ie $startup`
    atexit(() -> run(cmd))
    exit(0)
end
