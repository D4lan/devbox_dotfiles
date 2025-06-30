local f = io.open("./tools/bazel/gopackagesdriver.sh", "r")
if f ~= nil then
    io.close(f)
    local dir = vim.fn.getcwd()
    vim.fn.setenv("GOPACKAGESDRIVER", dir .. "/tools/bazel/gopackagesdriver.sh")
else
    vim.fn.setenv("GOPACKAGESDRIVER", "")
end

return {
    settings = {
        cmd_env = {
        },
        gopls = {
            verboseOutput = true,
            directoryFilters = {
                "-bazel-bin",
                "-bazel-out",
                "-bazel-testlogs",
                "-bazel-mux"
            },
            gofumpt = true,
            usePlaceholders = true,
            semanticTokens = true,
            codelenses = {
                gc_details = false,
                regenerate_cgo = true,
                generate = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true
            },
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}
