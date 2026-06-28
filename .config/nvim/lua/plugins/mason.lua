return
{
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "lua_ls",
      "pyright",
      "roslyn_ls",
      "neocmake",
      "marksman",
    }
  },
  
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {},
    },

    "neovim/nvim-lspconfig"
  },
}
