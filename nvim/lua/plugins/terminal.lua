return {
    {
        "akinsho/toggleterm.nvim",
        commit = "9a88eae",
        -- config = true, -- カスタムキー設定を行うため、trueではなく関数にします
        opts = {
            -- 注意: <C-t>をプレフィックス（後に続くキーを待つ状態）にするため、
            -- プラグイン標準の即時トグル設定はコメントアウトまたは別のキーに変更推奨です
            -- open_mapping = [[<c-t>]],
            -- open_mapping = [[<c-\>]], -- 必要ならデフォルトの <C-\> などを残しておく
            -- hide_numbers = true,
            -- shade_filetypes = {},
            -- shade_terminals = true,
            -- shading_factor = 2,
            -- start_in_insert = true,
            insert_mappings = true,
            -- persist_size = true,
            direction = "float",
            close_on_exit = true,
        },
        config = function(_, opts)
            -- 1. プラグインのセットアップを実行
            require("toggleterm").setup(opts)

            -- 2. キーマッピングの定義
            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = "ToggleTerm: " .. desc })
            end

            -- Ctrl-t + t: 現状アクティブなターミナルを表示 (Toggle)
            map({ "n", "t" }, "<C-t>t", "<cmd>ToggleTerm<CR>", "Toggle")

            -- Ctrl-t + s: TermSelectを起動
            map("n", "<C-t>s", "<cmd>TermSelect<CR>", "Select")

            -- Ctrl-t + n: 名前を決めてターミナルを起動
            map("n", "<C-t>n", function()
                vim.ui.input({ prompt = "New Terminal Name: " }, function(input_name)
                    if input_name and input_name ~= "" then
                        vim.cmd("TermNew name=" .. input_name)
                    end
                end)
            end, "New Named Terminal")
        end,
    },
}
