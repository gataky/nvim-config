return {
  "theprimeagen/jvim.nvim",
    -- stylua: ignore
    keys = {
        { "<up>", function() require("jvim").to_parent() end, },
        { "<down>", function() require("jvim").descend() end, },
        { "<left>", function() require("jvim").prev_sibling() end, },
        { "<right>", function() require("jvim").next_sibling() end, },
    }
,
}
