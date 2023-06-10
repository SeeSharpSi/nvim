require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.phpcbf, -- php formatting
    require("null-ls").builtins.formatting.blade_formatter, -- blade php formatting
    require("null-ls").builtins.formatting.prettierd, -- prettier deesnuts
    require("null-ls").builtins.formatting.gofmt, -- go formatting
    require("null-ls").builtins.formatting.goimports, -- go imports
  },
})
vim.cmd('map <Leader>pd :lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>')
