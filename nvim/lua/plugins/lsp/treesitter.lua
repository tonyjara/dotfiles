return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            init = function()
                -- PERF: no need to load the plugin, if we only need its queries for mini.ai
                local plugin = require("lazy.core.config").spec.plugins["nvim-treesitter"]
                local opts = require("lazy.core.plugin").values(plugin, "opts", false)
                local enabled = false
                if opts.textobjects then
                    for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
                        if opts.textobjects[mod] and opts.textobjects[mod].enable then
                            enabled = true
                            break
                        end
                    end
                end
                if not enabled then
                    require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                end
            end,
        },
    },
    opts = {
        -- A list of parser names, or "all" (the four listed parsers should always be installed)
        ensure_installed = {
            "help",
            "javascript",
            "typescript",
            "tsx",
            "json",
            "yaml",
            "c",
            "lua",
            "vim",
            "help",
            "html",
            "css",
            "markdown",
            "markdown_inline",
            "prisma",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = true,
        autotag = {
            enable = true,
        },
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        autopairs = {
            enable = true,
        },
        highlight = {
            enable = true, -- false will disable the whole extension
            disable = {}, -- list of language that will be disabled
            additional_vim_regex_highlighting = true,
        },
        indent = {
            enable = true,
            --[[ disable = { "yaml" } ]]
        },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
        rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
        },
        -- termcolors = {} -- table of colour name strings
    },
    config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
            ---@type table<string, boolean>
            local added = {}
            opts.ensure_installed = vim.tbl_filter(function(lang)
                if added[lang] then
                    return false
                end
                added[lang] = true
                return true
            end, opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)
    end,
}
--[[ local parser_config = require("nvim-treesitter.parsers").get_parser_configs() ]]
--[[ parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" } ]]
