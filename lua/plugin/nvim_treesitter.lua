local nvim_treesitter_configs_setup, nvim_treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not nvim_treesitter_configs_setup then
    return
end

nvim_treesitter_configs.setup {
    ensure_installed = { "c", "lua", "vim", "help", "python", "javascript", "typescript", "tsx" },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true,
    }
}
