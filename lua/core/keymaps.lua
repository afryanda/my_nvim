-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap.set
-- local default_opts = { silent = true, noremap = true }
local expr_opts = { expr = true, silent = true, noremap = true }

-- Ctrl + S to save
keymap('i', '<C-S>', '<ESC>:w<CR>')
keymap('n', '<C-S>', '<ESC>:w<CR>')

-- Escape with jk
keymap('i', 'jk', '<ESC>')
keymap('t', 'jk', '<C-\\><C-n>')

-- Paste over currently selected text without yanking it
keymap('v', 'p', '"_dP')

-- Cancel search highlighting with ESC
keymap('n', '<ESC>', ':nohlsearch<Bar>:echo<CR>')

-- delete single character without copying into register
keymap("n", "x", '"_x')

-- increment/decrement numbers
keymap("n", "<leader>+", "<C-a>") -- increment
keymap("n", "<leader>-", "<C-x>") -- decrement

-- Move selected line / block of text in visual mode
keymap('x', 'K', ":move '<-2<CR>gv-gv")
keymap('x', 'J', ":move '>+1<CR>gv-gv")

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>")
keymap("n", "<Right>", ":vertical resize -1<CR>")
keymap("n", "<Up>", ":resize -1<CR>")
keymap("n", "<Down>", ":resize +1<CR>")

-- Nvim Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope Nvim
local builtin = require('telescope.builtin')
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})

-- telescope git commands (not on youtube nvim video)
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
