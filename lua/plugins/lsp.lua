local python = {
    settings = {
        -- used for code navigation and code completion
        pylsp = {
            plugins = {
                autopep8 = { enabled = false },
                flake8 = { enabled = false },
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
            },
        },
    },
}

return {
    "neovim/nvim-lspconfig",
    opts = {
        diagnostics = {
            virtual_text = false,
        },
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        format = {
                            enable = true,
                            defaultConfig = {
                                indent_style = "space",
                                indent_size = "4",
                            },
                        },
                    },
                },
            },
            pylsp = python,
            ruff_lsp = {},
            clangd = {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                },
            },
        },
    },
}
