vim.g.mapleader = " " -- maps space to word leader

-- This is necessary to not source nvim-tree every time
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<leader>bb", "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<leader>bf", "<cmd>NvimTreeFindFile<CR>", opts)
map("n", "<leader>cc", "<cmd>NvimTreeCollapse<CR>", opts)

-- Unmap q so that no macros get accidentally triggered
map("n", "q", "<Nop>", opts)
map("v", "q", "<Nop>", opts)

-- Open LazyGit
map("n", "<leader>lg", "<cmd>:LazyGit<CR>", opts)

-- split horizontally and go back to the previous buffer
map("n", "<leader>]", "<cmd>vsplit<CR><cmd>BufferLineCyclePrev<CR><C-w>p", opts) --add <C-w>p to go to the new pane

-- Lazy git
map("n", "<leader>lg", "<cmd>:LazyGit<CR>", opts)

-- UNMAP H to improve typing
--[[ vim.keymap.set("n", "h", "<Nop>") ]]
--Allows ctrl d and u nav to keep cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--Allows search terms to be in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dp') -- paste over selection
vim.keymap.set("n", "]p", "o<Esc>p") -- Paste on the next line

-- INSERT MODE REBINDS
-- Exits i mode
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "<C-s>", "<Esc><cmd>update<CR>") -- SAVES file

--NORMAL MODE REBINDS
-- Pane navigation
--[[ vim.keymap.set("n", "<leader>wh", "<C-w>h") ]]
--[[ vim.keymap.set("n", "<leader>wl", "<C-w>l") ]]
--[[ vim.keymap.set("n", "<leader>wc", "ZZ") ]]
vim.keymap.set("n", "d", '"_d') -- delete without cutting
vim.keymap.set("n", "ˇ", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<C-s>", "<cmd>update<CR>") -- SAVES file

--VISUAL MODE REBINDS
vim.keymap.set("v", "d", '"_d') -- delete without cutting
vim.keymap.set("v", "<C-s>", "<Esc><cmd>update<CR>") -- SAVES file
--[[ vim.keymap.set("v", "<leader>l", "$") --move end of line ]]
--[[ vim.keymap.set("v", "<leader>h", "^") --move start of line ]]
--Copy to clipboard
vim.keymap.set("v", "<leader>y", '"+y') --   vnoremap  <leader>y  "+y
--Keep cursor in place after v copy
vim.keymap.set("v", "y", "ygv<Esc>")
--   vnoremap  <leader>y  "+y
--nnoremap  <leader>Y  "+yg_
--nnoremap  <leader>y  "+y
--nnoremap  <leader>yy  "+yy
--
--" " Paste from clipboard
--nnoremap <leader>p "+p
--nnoremap <leader>P "+P
--vnoremap <leader>p "+p
--vnoremap <leader>P "+P
