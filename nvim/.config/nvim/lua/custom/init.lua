-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

-- hooks.add("setup_mappings", function(map)
--    map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
--    .... many more mappings ....
-- end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
  use {
    -- AutoSave: saving your work before the world collapses
    "Pocco81/AutoSave.nvim",
    config = function()
      local autosave = require "autosave"
      autosave.setup {
        enabled = true,
        execution_message = "Saved at : " .. vim.fn.strftime("%H:%M:%S"),
        events = { "InsertLeave", "TextChanged" },
        conditions = {
          exists = true,
          filename_is_not = {},
          filetype_is_not = {},
          modifiable = true,
        },
        clean_command_line_interval = 2500,
        on_off_commands = false,
        write_all_buffers = false,
        debounce_delay = 250
      }
    end,
    setup = function()
      require("core.utils").packer_lazy_load "AutoSave.nvim"
    end
  }

  use {
    -- LSP-installer: allows you to seamlessly manage LSP servers locally
    "williamboman/nvim-lsp-installer",
    opt = true,
    config = function()
      local lsp_installer = require "nvim-lsp-installer"
      lsp_installer.on_server_ready(function(server)
        local opts = {}
        server:setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
      end)
    end,
    setup = function()
      require("core.utils").packer_lazy_load "nvim-lsp-installer"
    end
  }

  use {
    -- A glow preview directly in your neovim buffer
    "ellisonleao/glow.nvim",
    opt = true,
    ft = {'markdown', 'mdown', 'mkdn', 'md', 'mkd', 'mdwn', 'mdtxt', 'mdtext', 'text', 'Rmd'}
  }

  use {
    -- Neorg - An Organized Future
    "nvim-neorg/neorg",
    after = "nvim-treesitter",
    config = function()
      require('neorg').setup {
        -- Tell Neorg what modules to load
        load = {
          ["core.defaults"] = {}, -- Load all the default modules
          ["core.norg.concealer"] = {}, -- Allows for use of icons
          ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
              workspaces = {
                my_workspace = "~/neorg"
              }
            }
          }
        }
      }
    end,
    requires = "nvim-lua/plenary.nvim"
    -- No lazy-load: "Neorg practically lazy loads itself - only a few lines of code are
    -- run on startup, these lines check whether the current extension is .norg, if it's
    -- not then nothing else loads"
  }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"

