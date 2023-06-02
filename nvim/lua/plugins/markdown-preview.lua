return {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }
        map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", opts)
    end,
}
