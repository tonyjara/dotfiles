require("settings.options")
require("settings.autocmds")
require("settings.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct
local opts = {
	change_detection = { enabled = false },
}

require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.colorschemes" },
	{ import = "plugins.lsp" },
	{ import = "plugins.ui" },
	{ import = "plugins.cursor" },
	{ import = "plugins.editor" },
	{ import = "plugins.versioning" },
	{ import = "plugins.utils" },
	{ import = "plugins.terminal" },
	--[[ { import = "plugins.developing" }, ]]
}, opts)
