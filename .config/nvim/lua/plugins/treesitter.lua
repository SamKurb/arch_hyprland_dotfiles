return
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,

  config = function()
    require("nvim-treesitter").install({
      "c",
      "cpp",
      "c_sharp",
      "java",
      "lua",
      "vim",
      "vimdoc",
      "python",
      "cmake"
    })
  end,
}
