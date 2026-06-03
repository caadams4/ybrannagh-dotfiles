vim.g.mapleader = " "

local o = vim.opt
o.number = true
o.relativenumber = true
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.ignorecase = true
o.smartcase = true
o.termguicolors = true
o.scrolloff = 8
o.undofile = true
o.signcolumn = "yes"

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- sql / data files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "yaml", "json" },
  callback = function() vim.opt_local.shiftwidth = 2; vim.opt_local.tabstop = 2 end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
-- TODO: switch to lazy.nvim and add LSP once I decide which ones
