return {

	"fedepujol/move.nvim", --used to move rows with alt
	config = function()
		local opts = { noremap = true, silent = true }
		-- Normal-mode commands
		vim.keymap.set("n", "∆", ":MoveLine(1)<CR>", opts)
		vim.keymap.set("n", "˚", ":MoveLine(-1)<CR>", opts)

		-- Visual-mode commands
		vim.keymap.set("v", "∆", ":MoveBlock(1)<CR>", opts)
		vim.keymap.set("v", "˚", ":MoveBlock(-1)<CR>", opts)
	end,
}
