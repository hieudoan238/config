require("catppuccin").setup({
	flavour = "mocha",
	integrations = {
	cmp = true,
	gitsigns = true,
	nvimtree = true,
	treesitter = true,
	barbar = false,
	}
})
vim.cmd.colorscheme "catppuccin"
