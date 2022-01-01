-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- IMPORTANT: To use this file, copy the structure of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

M.options = {
  timeoutlen = 1000
}

M.ui = {
  theme = "onenord",
}

M.mappings.plugins = {
  comment = {
    toggle = "<leader>º"
  },
  telescope = {
    buffers = "<leader>fb",
    find_files = "<leader>ff",
    find_hiddenfiles = "<leader>fa",
    git_commits = "<leader>cm",
    git_status = "<leader>gt",
    help_tags = "<leader>fh",
    live_grep = "<leader>fw",
    oldfiles = "<leader>fr",
    themes = "<leader>th", -- NvChad theme picker

    telescope_media = {
       media_files = "<leader>fp",
    },
  },
}

-- NvChad included plugin options & overrides
-- To change the Packer `config` of a plugin that comes with NvChad,
-- add a table entry below matching the plugin github name
--              '-' -> '_', remove any '.lua', '.nvim' extensions
-- this string will be called in a `require`
--              use "(custom.configs).my_func()" to call a function
--              use "custom.blankline" to call a file
M.plugins = {
   status = {
     dashboard = true,
   },
   options = {
     statusline = {
       style = "arrow"
     },
     lspconfig = {
       setup_lspconf = "custom.plugins.lspconfig",
     },
   },
   default_plugin_config_replace = {
     dashboard = "custom.plugins.dashboard",
     gitsigns = "custom.plugins.gitsigns",
     nvim_treesitter = "custom.plugins.treesitter",
     nvim_cmp = "custom.plugins.cmp"
   }
}

return M
