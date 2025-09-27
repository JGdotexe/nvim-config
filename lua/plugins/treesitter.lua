return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config =  function()
		local config = require("nvim-treesitter.configs")
		config.setup({
		  ensure_installed = { "c", "lua","javascript", "html", "css", "bash", "ruby", "python" },
		  sync_install = false,
		  highlight = { enable = true, additional_vim_regex_highlighting = true,},
		  indent = { enable = true },
		})
	end
}
