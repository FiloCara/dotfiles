local opts = {noremap = true, silent = true}
-- Normal --
-- Better window navigation

vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Terminal --
-- Exit Terminal mode with <Esc>
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)

-- Toggle terminal - TO BE IMPROVED
vim.keymap.set('n', '<leader>t', ':split | :resize -10 | terminal<CR>', opts)

-- Copy outside of VIM
vim.keymap.set("n", "<leader>Y", [["+y]], opts)

-- Easily move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Enforce cursor in the middle of the screen when moving aroud
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

