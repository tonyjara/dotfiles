return {
	"ziontee113/icon-picker.nvim",
	config = function()
		require("icon-picker").setup({
			disable_legacy_commands = true,
		})

		vim.keymap.set("n", "<Leader>ep", "<cmd>IconPickerNormal<cr>", {
			noremap = true,
			silent = true,
			desc = "Emoji Picker normal",
		})
		vim.keymap.set("n", "<Leader>ey", "<cmd>IconPickerYank<cr>", {
			noremap = true,
			silent = true,
			desc = "Emoji picker yank",
		}) --> Yank the selected icon into register
		--[[ vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts) ]]
	end,
}
