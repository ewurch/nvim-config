return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").html.setup({
        filetypes = { "html", "htmldjango" },
      })
    end,
  },
}
