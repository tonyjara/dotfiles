return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			-- Map of filetype to formatters
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd" } },
				typescript = { { "prettierd" } },
				typescriptreact = { { "prettierd" } },
				astro = { { "prettierd" } },
				css = { { "prettierd" } },
				scss = { { "prettierd" } },
				html = { { "prettierd" } },
				json = { { "prettierd" } },
				yaml = { { "prettierd" } },
				markdown = { { "prettierd" } },
				graphql = { { "prettierd" } },
				md = { { "prettierd" } },
				txt = { { "prettierd" } },
				-- Use the "*" filetype to run formatters on all files.
				-- Note that if you use this, you may want to set lsp_fallback = "always"
				-- (see :help conform.format)
				--[[ ["*"] = { "trim_whitespace" }, ]]
			},
			-- If this is set, Conform will run the formatter on save.
			-- It will pass the table to conform.format().
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_fallback = true,
				timeout_ms = 500,
			},
			-- If this is set, Conform will run the formatter asynchronously after save.
			-- It will pass the table to conform.format().
			format_after_save = {
				lsp_fallback = true,
			},
			-- Set the log level. Use `:ConformInfo` to see the location of the log file.
			log_level = vim.log.levels.ERROR,
			-- Conform will notify you when a formatter errors
			notify_on_error = true,
		})
	end,
}
