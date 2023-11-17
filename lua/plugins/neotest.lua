return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
    },
    opts = {
      log_level = vim.log.levels.DEBUG,
      adapters = {
        ["neotest-python"] = {
          runner = "pytest",
        },
        ["neotest-jest"] = {},
      },
      status = {
        virtual_text = false,
      },
    },
  },
}
