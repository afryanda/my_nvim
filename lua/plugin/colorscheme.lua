local tokyonight_setup, tokyonight = pcall(require, "tokyonight")
if not tokyonight_setup then
    return
end

local TOKYONIGHT_SETTINGS = {
    transparent = true,
    style = "night"
}

tokyonight.setup(TOKYONIGHT_SETTINGS)

vim.cmd [[colorscheme tokyonight-storm]]
