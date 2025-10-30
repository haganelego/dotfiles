return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "j-hui/fidget.nvim",
        },
        config = function(_, opts)
            local spinner = require("plugins.ai.fidget-spinner")
            spinner:init()

            -- Setup the entire opts table
            require("codecompanion").setup(opts)
        end,

        opts = {
            strategies = {
                -- Change the default chat adapter
                chat = {
                    adapter = {
                        name = "gemini",
                        model = "gemini-2.5-flash",
                    },
                    roles = {
                        llm = function(adapter)
                            return " CodeCompanion (" .. adapter.formatted_name .. ")"
                        end,
                        user = " Me",
                    },
                },
                inline = {
                    keymaps = {
                        accept_change = {
                            modes = { n = "cca" }, -- gDiffAccept
                        },
                        reject_change = {
                            modes = { n = "ccr" }, -- gDiffReject
                        },
                        always_accept = {
                            modes = { n = "cct" },
                        },
                    },
                    adapter = {
                        name = "gemini",
                        model = "gemini-2.5-flash",
                    },
                    roles = {
                        llm = function(adapter)
                            return " CodeCompanion (" .. adapter.formatted_name .. ")"
                        end,
                        user = " Me",
                    },
                },
                agent = {
                    adapter = {
                        name = "gemini",
                        model = "gemini-2.5-flash",
                    },
                    roles = {
                        llm = function(adapter)
                            return " CodeCompanion (" .. adapter.formatted_name .. ")"
                        end,
                        user = " Me",
                    },
                },
            },
            adapters = {
                ollama = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        schema = {
                            model = {
                                default = "gpt-oss:20b",
                            },
                        },
                    })
                end,
                gemini = function()
                    return require("codecompanion.adapters").extend("gemini", {
                        schema = {
                            model = {
                                default = "gemini-2.5-flash",
                                choices = {
                                    ["gemini-2.5-flash-lite"] = { can_reason = true, has_vision = true },
                                },
                            },
                        },
                    })
                end,
                acp = {
                    codex = function()
                        return require("codecompanion.adapters").extend("codex", {
                            defaults = {
                                auth_method = "chatgpt", -- "openai-api-key"|"codex-api-key"|"chatgpt"
                            },
                        })
                    end,
                },
            },
            opts = {
                language = "Japanese",
                -- Set debug logging
                log_level = "DEBUG",
            },
            display = {
                chat = {
                    show_header_separator = true,
                },
            },
        },
        keys = {
            {
                "<leader>ccf",
                ":CodeCompanion<CR>",
                mode = { "n", "v" },
                silent = true,
                desc = "CodeCompanion",
            },
            {
                "<leader>ccc",
                ":CodeCompanionChat<CR>",
                mode = { "n", "v" },
                silent = true,
                desc = "CodeCompanion Chat",
            },
            {
                "<leader>cca",
                ":CodeCompanionAction<CR>",
                mode = { "n", "v" },
                silent = true,
                desc = "CodeCompanion Action",
            },
        },
    },
}
