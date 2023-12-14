return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        opts = {
            suggestion = { enabled = true },
            panel = { enabled = true },
            filetypes = {
                markdown = true,
                help = true,
                c = true,
                python = true,
                typescript = true,
            },
        },
    },
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        cmd = "ChatGPT",
        config = function()
            require("chatgpt").setup({
                api_key_cmd = "keyring get chatgpt.nvim jeffor",
                openai_params = {
                    model = "gpt-3.5-turbo-0613",
                },
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
    },
    -- {
    --     "gataky/ai.nvim",
    --     dependencies = {
    --         "gataky/structlog.nvim",
    --     },
    --     dir = "~/Documents/nvim/ai.nvim",
    --     lazy = false,
    --     dev = true,
    --     config = function(opts)
    --         vim.opt.runtimepath:append("~/Documents/nvim/ai.nvim")
    --         require("ai").setup()
    --     end,
    -- },
}
