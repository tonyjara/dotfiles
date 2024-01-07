return {
	"vuki656/package-info.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	configs = function()
		require("package-info").setup({
			colors = {
				up_to_date = "237", -- cterm Grey237
				outdated = "173", -- cterm LightSalmon3
			},
			package_manager = "pnpm",
			autostart = false,
		})

		-- Show dependency versions
		vim.keymap.set({ "n" }, "<LEADER>ns", require("package-info").show, { silent = true, noremap = true })

		-- Hide dependency versions
		vim.keymap.set({ "n" }, "<LEADER>nc", require("package-info").hide, { silent = true, noremap = true })

		-- Toggle dependency versions
		vim.keymap.set({ "n" }, "<LEADER>nt", require("package-info").toggle, { silent = true, noremap = true })

		-- Update dependency on the line
		vim.keymap.set({ "n" }, "<LEADER>nu", require("package-info").update, { silent = true, noremap = true })

		-- Delete dependency on the line
		vim.keymap.set({ "n" }, "<LEADER>nd", require("package-info").delete, { silent = true, noremap = true })

		-- Install a new dependency
		vim.keymap.set({ "n" }, "<LEADER>ni", require("package-info").install, { silent = true, noremap = true })

		-- Install a different dependency version
		vim.keymap.set({ "n" }, "<LEADER>np", require("package-info").change_version, { silent = true, noremap = true })
	end,
}
