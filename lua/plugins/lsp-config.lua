return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
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
	{
		"neovim/nvim-lspconfig",


		config = function()
    local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
			require("lspconfig").csharp_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.eslint.setup({
				--- ...
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})
    	lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			require("lspconfig").html.setup({
				capabilities = capabilities,
			})
			require("lspconfig").cssls.setup({
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
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- Change this symbol to your liking
        },
        signs = true, -- Show signs in the gutter
        underline = true, -- Underline diagnostic text
        update_in_insert = false, -- Update diagnostics only after leaving insert mode
      })
      
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
