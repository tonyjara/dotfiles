vim.g.mapleader = " " -- maps space to word leader

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Navigate start, end, top and bottom
map("n", "L", "$", opts) --end
map("n", "H", "^", opts) --start

map("v", "L", "$", opts) --end
map("v", "H", "^", opts) --start

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

--NOTE: Sort
map("v", "<leader>ss", ":'<,'>sort<CR>", { noremap = true, silent = true, desc = "Sort desc" })
map("v", "<leader>sr", ":'<,'>sort!<CR>", { noremap = true, silent = true, desc = "Sort reverse" })
map("v", "<leader>su", ":'<,'>sort u<CR>", { noremap = true, silent = true, desc = "Sort unique" })
map("n", "<leader>si{", "vi{:'<,'>sort<CR>", { noremap = true, silent = true, desc = "Sort inside brackets" })

--NOTE: Bufferkeymaps

-- split horizontally and go back to the previous buffer
map(
	"n",
	"<leader>]",
	"<cmd>vsplit<CR><cmd>BufferLineCyclePrev<CR><C-w>p",
	{ noremap = true, silent = true, desc = "Split horizontally and go back to the previous buffer" }
)
--  Go to definition in a split
map(
	"n",
	"<leader>v]",
	"<C-]><cmd>vsplit<CR><cmd>BufferLineCyclePrev<CR><C-w>p",
	{ noremap = true, silent = true, desc = "Go to definition in a split" }
)
-- Clear all buffers and splits Buffer kill
map(
	"n",
	"<leader>bk",
	"<cmd>%bd<cr><cmd>Bdelete<cr>",
	{ noremap = true, silent = true, desc = "Clear all buffers and splits" }
)
-- Clear all buffers and splits but the one where the cursor is, Buffer isolate
map(
	"n",
	"<leader>bi",
	"<cmd>%bd|e#<cr>",
	{ noremap = true, silent = true, desc = "Clear all buffers and splits but the one where the cursor is" }
)

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

-- INSERT MODE REBINDS
-- Exits i mode
map("i", "jj", "<Esc>")
map("i", "jk", "<Esc>")
map("i", "<C-s>", "<Esc><cmd>update<CR>") -- SAVES file

--NORMAL MODE REBINDS
-- Pane navigation
map("n", "d", '"_d') -- delete without cutting
map("n", "c", '"_c') -- change without cutting
map("n", "ˇ", "<cmd>tabclose<CR>")
map("n", "<C-s>", "<cmd>update<CR>") -- SAVES file
map("n", "<leader>s", "<cmd>update<CR>") -- SAVES file

--VISUAL MODE REBINDS
map("v", "d", '"_d') -- delete without cutting
map("v", "c", '"_c') -- delete without cutting
map("v", "<C-s>", "<Esc><cmd>update<CR>") -- SAVES file

--Copy to clipboard
map("v", "<leader>y", '"+y') --   vnoremap  <leader>y  "+y
--Keep cursor in place after v copy
map("v", "y", "ygv<Esc>")
