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

M.mappings = {
  terminal = {
    -- get out of terminal mode
    esc_termmode = { "JK" },

    -- get out of terminal mode and hide it
    esc_hide_termmode = { }
  }
}

M.mappings.plugins = {
  comment = {
    toggle = "<leader>º"
  },
  telescope = {
    oldfiles = "<leader>fr",
  }
}

-- NvChad included plugin options & overrides
-- To change the Packer `config` of a plugin that comes with NvChad,
-- add a table entry below matching the plugin github name
--              '-' -> '_', remove any '.lua', '.nvim' extensions
-- this string will be called in a `require`
--              use "(custom.configs).my_func()" to call a function
--              use "custom.blankline" to call a file
-- Install plugins
local userPlugins = require "custom.plugins"

M.plugins = {
   install = userPlugins,
   status = {
     alpha = true,
   },
   options = {
     statusline = {
       style = "arrow"
     },
     lspconfig = {
       setup_lspconf = "custom.plugins.lspconfig",
     },
     luasnip = {
       snippet_path = {"~/.config/nvim/lua/custom/snippets/"},
       -- Check https://github.com/rafamadriz/friendly-snippets for how to write vscode formatted snippets
     },
   },
   default_plugin_config_replace = {
     alpha = "custom.plugins.alpha",
     gitsigns = "custom.plugins.gitsigns",
   }
}

return M
