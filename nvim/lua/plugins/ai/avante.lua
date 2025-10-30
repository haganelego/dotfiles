return {
    {
        "yetone/avante.nvim",
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        -- ⚠️ must add this setting! ! !
        build = vim.fn.has("win32") ~= 0
                and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        ---@module 'avante'
        ---@type avante.Config
        opts = {
            provider = "ollama",
            providers = {
                ollama = {
                    endpoint = "http://127.0.0.1:11434", -- Note that there is no /v1 at the end.
                    model = "gemma3:latest",
                },
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
        },
    },
    {
        "saghen/blink.cmp",
        dependencies = {
            "Kaiser-Yang/blink-cmp-avante",
            -- ... Other dependencies
        },
        opts = {
            sources = {
                -- Add 'avante' to the list
                default = { "avante", "lsp", "path", "luasnip", "buffer" },
                providers = {
                    avante = {
                        module = "blink-cmp-avante",
                        name = "Avante",
                        opts = {
                            -- options for blink-cmp-avante
                        },
                    },
                },
            },
        },
    },
}
