local util = require("lspconfig.util")

return {
  single_file_support = false,

  root_dir = util.root_pattern(
    "compile_commands.json",
    "compile_flags.txt",
    "CMakeLists.txt",
    ".git"
  ),

  cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never" },
}

