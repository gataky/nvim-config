return {
    -- "gataky/harpoon",
    -- branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    dir = "~/Documents/nvim/harpoon",
    -- dev = true,
    config = function(opts)
        vim.opt.runtimepath:append("~/Documents/nvim/harpoon")
        require("harpoon"):setup(opts)
    end,
    -- stylua: ignore
    keys = {
        { "<leader>a", function() require("harpoon"):list():append() end, desc = "Harpoon Append" },
        { "<leader>h", function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list(), { border = "rounded", title_pos = "center", bg_highlight="lualine_a_terminal2"})
            end, desc = "Harpoon List" },
        { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon #1" },
        { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon #2" },
        { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon #3" },
        { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon #4" },
    },
}
