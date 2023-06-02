return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		open_mapping = [[÷]],
		persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
		direction = "float",
		--[[ shade_terminals = true, ]]
		--[[ shading_factor = -30, ]]
		float_opts = {
			border = "curved",
			width = 120,
			height = 30,
			winblend = 3,
			zindex = 3,
		},
	},
}
