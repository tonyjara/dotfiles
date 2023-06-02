return {
	"github/copilot.vim",
	config = function()
		local map = vim.api.nvim_set_keymap
		map("n", "<leader>cpd", "<cmd>Copilot disable<CR>", {
			noremap = true,
			silent = true,
			desc = "Copilot disable",
			callback = function()
				print("Copilot disabled")
			end,
		})
		map("n", "<leader>cpe", "<cmd>Copilot enable<CR>", {
			noremap = true,
			silent = true,
			desc = "Copilot enable",
			callback = function()
				print("Copilot enabled")
			end,
		})
	end,
}
