-- Auto open nvim-tree
local function open_nvim_tree()
	require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local function set_soft_wrap_mode()
	require("wrapping").soft_wrap_mode()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = set_soft_wrap_mode })

-- Gets rid of annoying comments after pressing enter.
--[[ local augroup = vim.api.nvim_create_augroup ]]
--[[ local autocmd = vim.api.nvim_create_autocmd ]]
--[[]]
--[[ local FormatOptions = augroup("FormatOptions", { clear = true }) ]]
--[[ autocmd("BufEnter", { ]]
--[[ 	group = FormatOptions, ]]
--[[ 	pattern = "*", ]]
--[[ 	desc = "Set buffer local formatoptions.", ]]
--[[ 	callback = function() ]]
--[[ 		vim.opt_local.formatoptions:remove({ ]]
--[[ 			"r", -- Automatically insert the current comment leader after hitting <Enter> in Insert mode. ]]
--[[ 			"o", -- Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode. ]]
--[[ 		}) ]]
--[[ 	end, ]]
--[[ }) ]]
