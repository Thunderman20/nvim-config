--here is my plugins/lsp.lua

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets", name = "friendly-snippets" } },
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				javascriptreact = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
				lua = { "stylua" },
				rust = { "rustfmt" },
			},
			formatters = {
				prettierd = {
					prepend_args = { "--no-semi" },
				},
			},
		})
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				"html",
				"cssls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- zls = function()
				-- 	local lspconfig = require("lspconfig")
				-- 	lspconfig.zls.setup({
				-- 		root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
				-- 		settings = {
				-- 			zls = {
				-- 				enable_inlay_hints = true,
				-- 				enable_snippets = true,
				-- 				warn_style = true,
				-- 			},
				-- 		},
				-- 	})
				-- 	vim.g.zig_fmt_parse_errors = 0
				-- 	vim.g.zig_fmt_autosave = 0
				-- end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							-- Ensure the formatter is enabled on save
							if client.server_capabilities.documentFormattingProvider then
								vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
							end
						end,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
				["emmet_language_server"] = function() -- Add this handler
					local lspconfig = require("lspconfig")
					lspconfig.emmet_language_server.setup({
						capabilities = capabilities, -- Attach your capabilities here
						filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For luasnip users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					local luasnip = require("luasnip")
					if cmp.visible() then
						cmp.confirm({ select = true })
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					local luasnip = require("luasnip")
					if luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "friendly-snippets" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
