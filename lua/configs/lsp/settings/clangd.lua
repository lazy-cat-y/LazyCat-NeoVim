local util = require("lspconfig.util")

return {
    capabilities = {
        offsetEncoding = { "utf-8", "utf-16" },
        textDocument = {
            completion = {
                editsNearCursor = true
            }
        }
    },
    root_markers = {
        ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", "configure.ac", ".git"
    }
}
