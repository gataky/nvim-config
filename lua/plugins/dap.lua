return {
  {
    "nvim-dap-virtual-text",
    opts = {
      enabled = true,
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mfussenegger/nvim-dap-python",
      config = function()
        local path = require("mason-registry").get_package("debugpy"):get_install_path()
        require("dap-python").setup(path .. "/venv/bin/python")
        require("dap-python").test_runner = "pytest"
      end,
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#e00d0d" })
      vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#6be612" })
      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapStopped", { text = "󰁔", texthl = "DapStopped" })

      local function DebugMappingKeyBindings(active)
        local opts = { noremap = true, silent = true, buffer = false }
        if active then
          local set = vim.keymap.set
          set("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", opts)
          set("n", "<leader>do", "<cmd>lua require('dap').step_over()<CR>", opts)
          set("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>", opts)
          -- set("n", "<leader>d", "<cmd>lua require('dap').step_out()<CR>", opts)
          set("n", "<leader>du", "<cmd>lua require('dap').up()<CR>", opts)
          set("n", "<leader>dd", "<cmd>lua require('dap').down()<CR>", opts)
          set("n", "<leader>dt", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
          set("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>", opts)
          set("n", "<leader>dq", "<cmd>lua require('dap').disconnect()<CR>", opts)
          set("n", "<leader>df", function()
            require("dapui").float_element("scopes", { enter = true })
          end)
        else
          -- pcall(function()
          --   local del = vim.keymap.del
          --   del("n", "c", opts)
          --   del("n", "n", opts)
          --   del("n", "s", opts)
          --   del("n", "o", opts)
          --   del("n", "u", opts)
          --   del("n", "d", opts)
          --   del("n", "b", opts)
          --   del("n", "r", opts)
          --   del("n", "q", opts)
          -- end)
        end
      end

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
        DebugMappingKeyBindings(true)
      end

      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end

      dap.listeners.after.event_terminated["dapui_config"] = function()
        DebugMappingKeyBindings(false)
        dapui.close()
      end
    end,
  },
}
