local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove comments after pressing enter
local FormatOptions = augroup("FormatOptions", { clear = true })
autocmd("BufEnter", {
	group = FormatOptions,
	pattern = "*",
	desc = "Set buffer local formatoptions.",
	callback = function()
		vim.opt_local.formatoptions:remove({
			"r", -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
			"o", -- Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
		})
	end,
})

autocmd({ "BufEnter", "BufNewFile" }, {
	pattern = ".env*",
	command = "set filetype=conf",
})
