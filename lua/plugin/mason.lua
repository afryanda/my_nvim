local mason_setup, mason = pcall(require, "mason")
local mason_lspconfig_setup, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_setup then
    return
end

if not mason_lspconfig_setup then
    return
end

local MASON_LSP_SETTINGS = {
    ensure_installed = { "pyright", "tsserver", "rust_analyzer" }
}

mason.setup()
mason_lspconfig.setup(MASON_LSP_SETTINGS)
mason_lspconfig.setup_handlers {
    function(server_name)
        require("lspconfig")[server_name].setup {}
    end,
}
