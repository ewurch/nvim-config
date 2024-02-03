return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  keys = {
    { "<Space>tt", desc = "Run test" },
    { "<Space>to", desc = "Toggle output" },
    { "<Space>ts", desc = "Test summary" },
    { "<Space>tf", desc = "Run file tests" },
    { "<Space>td", desc = "Debug test" },
    { "<Space>tp", desc = "Open test panel" },
    { "<Space>ta", desc = "Run project test suite" },
  },

  config = function()
    local neotest = require("neotest")
    neotest.setup({
      icons = {
        failed = "",
        passed = "",
        running = "",
        skipped = "○",
        unknown = "",
      },
      output = {
        enabled = true,
        open_on_run = true,
      },
      adapters = {
        require("neotest-python")({
          runner = "pytest",
        }),
      },
    })

    vim.keymap.set("n", "<Space>tt", function()
      vim.notify_once("Running single test", vim.log.levels.INFO, {
        title = "Neotest",
      })
      neotest.run.run()
    end)

    vim.keymap.set("n", "<Space>to", function()
      neotest.output.open({
        enter = true,
        auto_close = true,
        new_buf = true,
      })
    end)

    vim.keymap.set("n", "<Space>ts", function()
      neotest.summary.toggle()
    end)
    vim.keymap.set("n", "<Space>tf", function()
      vim.notify_once("Running tests", vim.log.levels.INFO, {
        title = "Neotest",
      })
      neotest.run.run(vim.fn.expand("%"))
    end)
    vim.keymap.set("n", "<Space>td", function()
      vim.notify_once("Start debugging test", vim.log.levels.INFO, {
        title = "Neotest",
      })
      neotest.run.run({ strategy = "dap" })
    end)
    vim.keymap.set("n", "<Space>tp", function()
      neotest.output_panel.open()
    end)
    vim.keymap.set("n", "<Space>ta", function()
      vim.notify_once("Running project test suite", vim.log.levels.INFO, {
        title = "Neotest",
      })
      neotest.run.run(vim.fn.getcwd())
    end)
  end,
}
