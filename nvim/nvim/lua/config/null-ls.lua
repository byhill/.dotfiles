local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach= function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
            end,
        })
    end
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
    on_attach = on_attach,
    diagnostics_format = "[#{s}] (#{c}): #{m}",
    sources = {
        -- all
        formatting.trim_newlines,
        formatting.trim_whitespace,

        -- python
        formatting.black,
        diagnostics.flake8,
        formatting.isort,
        diagnostics.pylint.with({
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        }),
        null_ls.builtins.formatting.djhtml,

        -- css
        diagnostics.stylelint,
        formatting.stylelint,
    },
})
