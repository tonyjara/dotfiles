return {
	"kylechui/nvim-surround",
	opts = function()
		-- Remap to Z to avoid issues with leap
		require("nvim-surround").setup({
			keymaps = {
				insert = "<C-g>z",
				insert_line = "<C-g>Z",
				normal = "yz",
				normal_cur = "yzz",
				normal_line = "yZ",
				normal_cur_line = "yZZ",
				visual = "Z",
				visual_line = "gZ",
				delete = "dz",
				change = "cz",
			},
		})
	end,
}
