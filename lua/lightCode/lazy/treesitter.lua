return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all"
			ensure_installed = {
				"vimdoc", "javascript", "typescript", "c", "cpp", "lua", 
				"bash", "asm", "python", "cmake",
			},

			-- Install parsers synchronously (only applied to 'ensure_installed')
			sync_install = false,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have 'tree-sitter' CLI installed locally
			auto_install = true,

			indent = {
				enable = true
			},

			highlight = {
				-- 'false' will disable the whole extension
				enable = true,

				-- Setting this to true will run ':h syntax' and tree-sitter at the same time.
				-- Set this to 'true' if you depend on "syntax" being enabled (like for indentation)
				-- Using this optuon may slow donw your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = { "markdown" },
			},
		})

		local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		treesitter_parser_config.temp1 = {
			install_info = {
				url = "https://github.com/vrishmann/tree-sitter-temp1.git",
				files = {"src/parser.c", "src/scanner.c"},
				branch = "master",
			},
		}

		vim.treesitter.language.register("temp1", "temp1")
	end
}
