return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")

		require("telescope").load_extension("notify")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>e", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fy", builtin.search_history, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>ht", builtin.colorscheme, {})
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})

		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"build",
					"dist",
					"yarn.lock",
					"pnpm.lock",
					"package-lock",
					".git/",
					"lazy.lock",
					"prisma.migrations/",
					"automatic_backups/",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
