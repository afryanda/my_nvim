local api = vim.api
-- Hightlight on yank
local yankGrp = api.nvim_create_augroup(
    "YankHighlight",
    { clear = true }
)
api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankGrp,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd(
    "BufReadPost",
    { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd(
    { "InsertLeave", "WinEnter" },
    { pattern = "*", command = "set cursorline", group = cursorGrp }
)
api.nvim_create_autocmd(
    { "InsertEnter", "WinLeave" },
    { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- suckless autocmd
local sucklessGrp = api.nvim_create_augroup(
    "suckless",
    { clear = true }
)
api.nvim_create_autocmd(
    "BufWritePost",
    { pattern = "**/config.def.h", command = "!doas cp config.def.h config.h && doas make clean install",
        group = sucklessGrp }
)

local lspFormatGrp = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = lspFormatGrp, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = lspFormatGrp,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
})
