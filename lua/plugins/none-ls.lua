return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require "null-ls"

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.biome,
        null_ls.builtins.diagnostics.stylelint.with {
          command = "/usr/local/bin/stylelint",
        },
        null_ls.builtins.formatting.stylelint.with {
          command = "/usr/local/bin/stylelint",
        },
        null_ls.builtins.completion.spell,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.diagnostics.checkstyle.with {
          extra_args = { "-c", "/google_checks.xml" },
        },
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
