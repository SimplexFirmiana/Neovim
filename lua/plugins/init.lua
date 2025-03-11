return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "vimdoc", "lua", "luadoc",
                "c", "cpp", "make", "cmake",
                "bash", "gitignore", "gitattributes", "gitcommit",
                "markdown", "rust", "tmux", "verilog", "vhdl", "yaml",
            },
        },
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        commit = "29be0919b91fb59eca9e90690d76014233392bef",
    },

    { "junegunn/fzf" },
    { "junegunn/fzf.vim" }, -- to enable preview (optional)
    {
        "ojroques/nvim-lspfuzzy",
        event = "LspAttach",
        dependencies = {
            { "junegunn/fzf" },
            { "junegunn/fzf.vim" }, -- to enable preview (optional)
        },
        config = function()
            require("lspfuzzy").setup {}
        end,
    },

    {
        "p00f/clangd_extensions.nvim",
        event = "LspAttach",
        ft = { "c", "cpp", "cxx", "cc" },
    },

    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup {}
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons",     -- optional
        },
    },

    {
        "folke/lazydev.nvim",
        opts = {}
    },

    {   -- optional cmp completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
    },
}
