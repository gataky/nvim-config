return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    -- add tsx and treesitter
    vim.list_extend(opts.ensure_installed, {
      -- Python
      -- "ruff",
      "isort",
      "black",
      -- "debugpy",
      -- -- Go
      -- "gopls",
      -- "gofumpt",
      -- "goimports-reviser",
      -- "goimports",
      -- "golines",
      -- "delve",
      -- -- Typescript
      -- "typescript-language-server",
      -- "prettierd",
      -- "eslint_d",
      -- "js-debug-adapter",
    })
  end,
}
