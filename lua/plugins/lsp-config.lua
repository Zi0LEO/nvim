return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,

    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local border = {
        { "🭽", "FloatBorder" },
        { "▔", "FloatBorder" },
        { "🭾", "FloatBorder" },
        { "▕", "FloatBorder" },
        { "🭿", "FloatBorder" },
        { "▁", "FloatBorder" },
        { "🭼", "FloatBorder" },
        { "▏", "FloatBorder" },
      }

      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end


      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- Change this symbol to your liking
        },
        signs = true, -- Show signs in the gutter
        underline = true, -- Underline diagnostic text
        update_in_insert = false, -- Update diagnostics only after leaving insert mode
        severity_sort = false,
      })

      lspconfig.csharp_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.jdtls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.gdscript.setup({
        capabilities = capabilities,
      })

      lspconfig.texlab.setup({
        settings = {
          texlab = {
            forwardSearch = {
              executable = "zathura", -- Replace with your PDF viewer
              args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
            chktex = {
              onOpenAndSave = true, -- Run chktex when the file is opened and saved
              onEdit = true, -- Run chktex as you type (real-time linting)
            },
          },
        },
      })
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
        capabilities = capabilities,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "jdtls", "eslint", "html", "cssls" },
        automatic_installation = true,
      })
    end,
  },
  {'mfussenegger/nvim-jdtls'},
}
