return {
	"hrsh7th/nvim-cmp",
	lazy = false,
	dependencies = {
		"L3MON4D3/LuaSnip",
		"neovim/nvim-lspconfig",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"FelipeLema/cmp-async-path",
		--"fefora/cmp-spell",
	},
	setup = {
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` user.
			end,
		},
		window = {
			completion = require("cmp").config.window.bordered(),
			documentation = require("cmp").config.window.bordered(),
		},
		mapping = require("cmp").mapping.preset.insert({
			["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
			["<C-f>"] = require("cmp").mapping.scroll_docs(4),
			["<C-Space>"] = require("cmp").mapping.complete(),
			["<C-e>"] = require("cmp").mapping.abort(),
			["<CR>"] = require("cmp").mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = require("cmp").config.sources({
			{ name = "luasnip" }, -- For luasnip users.
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "buffer" },
			--{ name = "cmdline" },
			--{ name = "async_path" },
			--{ name = "spell" },
		}),
		cmdline = {
			{ ":", "/", "?" },
			{
				mapping = require("cmp").mapping.preset.cmdline(),
				sources = require("cmp").config.sources({
					{ name = "cmdline" },
					{ name = "buffer" },
					{ name = "async_path" },
				}),
			},
		},
	},
}
