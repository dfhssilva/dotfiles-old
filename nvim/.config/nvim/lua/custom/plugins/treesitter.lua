-- Setting up TreeSitter for Neorg
local present, ts_parsers = pcall(require, 'nvim-treesitter.parsers')
if not present then
   return
end

local parser_configs = ts_parsers.get_parser_configs()
-- local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}

local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
   return
end

ts_config.setup {
   ensure_installed = {
      "lua",
      "vim",
      "python",
      "markdown",
      "norg",
      "norg_meta",
      "norg_table"
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}
