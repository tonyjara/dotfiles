return {
	"nvim-telescope/telescope.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local builtin = require("telescope.builtin")

		require("telescope").load_extension("notify")
		-- requires creating folder databases
		--[[ require("telescope").load_extension("smart_history") ]]

		--[[ vim.keymap.set("n", "<leader>fh", "<cmd>Telescope find_files hidden=true <cr>", {}) ]]
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fy", builtin.search_history, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>ht", builtin.colorscheme, {})
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})

		-- Fiinds words through all projects in scope
		--vim.keymap.set('n', '<leader>pf', function ()
		--    builtin.grep_string({ search = vim.fn.input("Grep > ") });
		--end)

		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"build",
					"dist",
					"yarn.lock",
					"pnpm.lock",
					".git/",
					"lazy.lock",
					"prisma.migrations/",
					"automatic_backups/",
				},
			},
		})
	end,
}
