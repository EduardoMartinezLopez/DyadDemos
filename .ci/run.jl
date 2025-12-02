using Pkg
using Logging: global_logger
using GitHubActions: GitHubActionsLogger, group
get(ENV, "GITHUB_ACTIONS", "false") == "true" && global_logger(GitHubActionsLogger())

# Gives us the ability to report what succeeded and what failed
include("github_utils.jl")

folders = filter(readdir(dirname(@__DIR__); join = true)) do path
    isdir(path) &&
    !startswith(basename(path), ".") &&
    isdir(joinpath(path, "dyad"))
end

for folder in folders
    group("Testing $folder") do
        @info "Instantiating project" 
        try
            withenv("JULIA_PKG_PRECOMPILE_AUTO" => "0") do 
                Pkg.activate(folder)
                Pkg.resolve()  
                Pkg.instantiate()          
            end
        catch e
            @error "Failed to instantiate project" error = e
            post_status(name = "$(basename(folder))/instantiate", type = "failure")
            continue
        end

        @info "Running tests"
        test_result = try
            Pkg.activate(folder)
            Pkg.test()
        catch e
            @error "Tests errored" error = e
            post_status(name = "$(basename(folder))/test", type = "error")
        end

        @info "Compiling with latest `dyad-lang`"
        compile_result = cd(folder) do
            success(`$(DyadHarness.dyad_cli_path) compile .`)
        end
        if compile_result == false
            @error "Compilation failed"
            post_status(name = "$(basename(folder))/dyad-compile", type = "failure")
            continue
        end

        @info "Running Dyad doc-gen"
        docgen_result = cd(folder) do
            success(`$(DyadHarness.dyad_cli_path) document $(basename(folder))`)
        end
        if docgen_result == false
            @error "Doc-gen failed"
            post_status(name = "$(basename(folder))/dyad-doc-gen", type = "failure")
            continue
        end

        @info "All steps succeeded"
        post_status(name = "$(basename(folder))/all", type = "success")
    end
end