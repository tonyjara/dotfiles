vim.g.mapleader = " " -- maps space to word leader

-- This is necessary to not source nvim-tree every time
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Navigate start, end, top and bottom
map("n", "J", "G", opts) --bottom
map("n", "K", "gg", opts) --top
map("n", "L", "$", opts) --end
map("n", "H", "^", opts) --start

map("v", "J", "G", opts) --bottom
map("v", "K", "gg", opts) --top
map("v", "L", "$", opts) --end
map("v", "H", "^", opts) --start

-- Nvim tree
map("n", "<leader>bb", "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<leader>bf", "<cmd>NvimTreeFindFile<CR>", opts)
map("n", "<leader>cc", "<cmd>NvimTreeCollapse<CR>", opts)

-- Unmap q so that no macros get accidentally triggered
map("n", "q", "<Nop>", opts)
map("v", "q", "<Nop>", opts)

-- Dap debugger keymaps
map("n", "<leader>db", "<cmd>:DapToggleBreakpoint<CR>", opts)
map("n", "<leader>dpr", function()
	require("dap-python").test_method()
end, opts)

-- Open LazyGit
map("n", "<leader>lg", "<cmd>:LazyGit<CR>", opts)

-- split horizontally and go back to the previous buffer
map("n", "<leader>]", "<cmd>vsplit<CR><cmd>BufferLineCyclePrev<CR><C-w>p", opts) --add <C-w>p to go to the new pane

-- Lazy git
map("n", "<leader>lg", "<cmd>:LazyGit<CR>", opts)

--Allows ctrl d and u nav to keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

--Allows search terms to be in the middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- PASTE REBINDS
map("n", "]p", "o<Esc>p") -- Paste on the next line
map("x", "<leader>p", '"_dp') -- paste over selection

-- INSERT MODE REBINDS
-- Exits i mode
map("i", "jj", "<Esc>")
map("i", "<C-s>", "<Esc><cmd>update<CR>") -- SAVES file

--NORMAL MODE REBINDS
-- Pane navigation
map("n", "d", '"_d') -- delete without cutting
map("n", "ˇ", "<cmd>tabclose<CR>")
map("n", "<C-s>", "<cmd>update<CR>") -- SAVES file

--VISUAL MODE REBINDS
map("v", "d", '"_d') -- delete without cutting
map("v", "<C-s>", "<Esc><cmd>update<CR>") -- SAVES file

--Copy to clipboard
map("v", "<leader>y", '"+y') --   vnoremap  <leader>y  "+y
--Keep cursor in place after v copy
map("v", "y", "ygv<Esc>")
