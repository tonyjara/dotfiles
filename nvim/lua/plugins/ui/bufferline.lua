return {
	"akinsho/nvim-bufferline.lua",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local bufferline = require("bufferline")

		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		-- KEY MAPS
		-- Move to previous/next
		-- Alt keys
		map("n", "˙", "<Cmd>BufferLineCyclePrev<CR>", opts)
		map("n", "¬", "<Cmd>BufferLineCycleNext<CR>", opts)
		-- Leader keys
		map("n", "<leader>hh", "<Cmd>BufferLineCyclePrev<CR>", opts)
		map("n", "<leader>ll", "<Cmd>BufferLineCycleNext<CR>", opts)

		map("n", "∑", "<cmd>Bdelete<cr>", opts) --close buffer
		map("n", "<leader>ww", "<cmd>Bdelete<cr>", opts) --close buffer
		map("n", "‘", "<cmd>vsplit<CR>", opts)
		bufferline.setup({
			options = {
				buffer_close_icon = "x",
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "NvimTree",
					},
				},
				separator_style = "slant",
				color_icons = true,
			},
			highlights = {
				-- Square at ends of buffer bg is the slant color, fg is the remainder
				separator = {
					fg = "#4f3661",
				},
				-- same as separator but for selected buffers
				separator_selected = {
					fg = "#4f3661",
				},
				buffer_selected = {
					fg = "#1cb600",
					bold = true,
				},
				fill = {
					bg = "#4f3661",
				},
			},
		})
	end,
}
