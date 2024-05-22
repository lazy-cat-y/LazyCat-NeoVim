local options = {
    autoindent = true,
    autoread = true,
    autowrite = true,

    backspace = "indent,eol,start",

    ingorecase = true,
    smartcase = true,

    relativenumber = true,

    clipboard = "unnamedplus"
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
