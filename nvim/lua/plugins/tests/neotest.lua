return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"haydenmeade/neotest-jest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "jest --watch ",
				}),
			},
		})
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tw",
			"<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
			{}
		)
	end,
}
