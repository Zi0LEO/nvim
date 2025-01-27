return
{
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  opts = {
    disable_frontmatter = true,
    workspaces = {
      {
        name = "SecondBrain",
        path = "~/Documents/SecondBrain",
      }
    }
  }
}


