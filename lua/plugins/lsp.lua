return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"basedpyright",
				"ruff",
				"bashls",
				"jsonls",
				"html",
				"cssls",
				"ts_ls",
				"sqlls"
			},
			automatic_installation = true,
		},
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				completion = {
					completeopt = "menu,menuone,noinsert",
				},

				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping(function(fallback)
						fallback()
					end, { "i", "s" }),

					["<C-j>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<C-k>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true })
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
				}),
			})

			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "buffer" },
				}),
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local capabilities = cmp_nvim_lsp.default_capabilities()

			vim.diagnostic.config({
				virtual_text = {
					spacing = 2,
					source = "if_many",
					prefix = "●",
				},
				float = {
					border = "rounded",
					source = "if_many",
				},
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				},
			})

			local on_attach = function(client, bufnr)
				local map = function(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
				end

				map("n", "gd", vim.lsp.buf.definition, "LSP definition")
				map("n", "gD", vim.lsp.buf.declaration, "LSP declaration")
				map("n", "gi", vim.lsp.buf.implementation, "LSP implementation")
				map("n", "grr", vim.lsp.buf.references, "LSP references")
				map("n", "grt", vim.lsp.buf.type_definition, "LSP type definition")
				map("n", "K", vim.lsp.buf.hover, "LSP hover")
				map("n", "<C-:>", vim.lsp.buf.signature_help, "LSP signature help")
				map("n", "<leader>rn", vim.lsp.buf.rename, "LSP rename")
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP code action")
				map("n", "<leader>f", function()
					vim.lsp.buf.format({ async = true })
				end, "LSP format")
				map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to loclist")

				if client.name == "ruff" then
					client.server_capabilities.hoverProvider = false
				end
			end

			local servers = {
				lua_ls = {
					capabilities = capabilities,
					on_attach = on_attach,
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								checkThirdParty = false,
								library = vim.api.nvim_get_runtime_file("", true),
							},
							completion = {
								callSnippet = "Replace",
							},
							telemetry = {
								enable = false,
							},
						},
					},
				},

				basedpyright = {
					capabilities = capabilities,
					on_attach = on_attach,
					settings = {
						basedpyright = {
							analysis = {
								typeCheckingMode = "basic",
								autoImportCompletions = true,
								diagnosticMode = "openFilesOnly",
								inlayHints = {
									variableTypes = true,
									callArgumentNames = true,
									functionReturnTypes = true,
									genericTypes = true,
								},
							},
						},
					},
				},

				ruff = {
					capabilities = capabilities,
					on_attach = on_attach,
					init_options = {
						settings = {
							args = {},
						},
					},
				},

				ts_ls = {
					capabilities = capabilities,
					on_attach = on_attach,
				},

				html = {
					capabilities = capabilities,
					on_attach = on_attach,
				},

				cssls = {
					capabilities = capabilities,
					on_attach = on_attach,
				},

				jsonls = {
					capabilities = capabilities,
					on_attach = on_attach,
				},

				bashls = {
					capabilities = capabilities,
					on_attach = on_attach,
				},
			}

			for server_name, config in pairs(servers) do
				vim.lsp.config(server_name, config)
			end

			local enabled_lsps = { "basedpyright", "ruff", "lua_ls", "sql" }

			for _, lsp in pairs(enabled_lsps) do
				vim.lsp.enable(lsp)
			end

			require("mason-lspconfig").setup({
				automatic_enable = true
			})
		end,
	},
}
