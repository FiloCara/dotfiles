vim.g.mapleader = " "

-- Copy outside NVIM
-- It requires win32yank: https://github.com/equalsraf/win32yank/
if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'                 -- allow the mouse to be used in Nvim
vim.opt.swapfile = false

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = true       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = true             -- display the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- Netrw
vim.g.netrw_banner = 0                 -- Remove banner 
vim.g.netrw_keepdir = 0                -- allow moving to parent directory
vim.g.netrw_liststyle = 3              -- Tree-like visualization
vim.g.netrw_localcopydircmd = 'cp -r'  -- enable recursive copy

--  TODO: better keybinding navigation: https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/

-- Autoswitch to INSERT mode when terminal open
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.cmd "startinsert!"
  end,
})
