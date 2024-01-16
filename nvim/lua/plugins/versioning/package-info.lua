return {
	"vuki656/package-info.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		local package = require("package-info")
		package.setup({
			colors = {
				up_to_date = "237", -- cterm Grey237
				outdated = "173", -- cterm LightSalmon3
			},
			package_manager = "pnpm",
			autostart = false,
		})

		-- Show dependency versions
		vim.keymap.set("n", "<LEADER>ns", package.show, { silent = true, noremap = true })

		-- Hide dependency versions
		vim.keymap.set("n", "<LEADER>nc", package.hide, { silent = true, noremap = true })

		-- Toggle dependency versions
		vim.keymap.set("n", "<LEADER>nt", package.toggle, { silent = true, noremap = true })

		-- Update dependency on the line
		vim.keymap.set("n", "<LEADER>nu", package.update, { silent = true, noremap = true })

		-- Delete dependency on the line
		vim.keymap.set("n", "<LEADER>nd", package.delete, { silent = true, noremap = true })

		-- Install a new dependency
		vim.keymap.set("n", "<LEADER>ni", package.install, { silent = true, noremap = true })

		-- Install a different dependency version
		vim.keymap.set("n", "<LEADER>np", package.change_version, { silent = true, noremap = true })
	end,
}
