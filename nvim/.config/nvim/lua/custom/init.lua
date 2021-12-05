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
    -- Neoscroll: a smooth scrolling neovim plugin written in lua
    "karb94/neoscroll.nvim",
    opt = true,
    config = function()
      require("neoscroll").setup()
    end,

    -- lazy loading
    setup = function()
      require("core.utils").packer_lazy_load "neoscroll.nvim"
    end,
    
    -- AutoSave: saving your work before the world collapses
    "Pocco81/AutoSave.nvim",
    config = function()
      local autosave = require "autosave"

      autosave.setup {
        enabled = true,
        execution_message = "autosaved at : " .. vim.fn.strftime "%H:%M:%S",
        events = { "InsertLeave", "TextChanged" },
        conditions = {
          exists = true,
          filetype_is_not = {},
          modifiable = true,
        },
        clean_command_line_interval = 2500,
        on_off_commands = true,
        write_all_buffers = false,
        debounce_delay = 750
      }
    end,

    -- TrueZen: clean and elegant distraction-free writing 
    "Pocco81/TrueZen.nvim",
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
       -- check https://github.com/Pocco81/TrueZen.nvim#setup-configuration (init.lua version)
       local true_zen = require("true-zen")

       true_zen.setup({
         ui = {
           bottom = {
             laststatus = 0,
             ruler = false,
             showmode = false,
             showcmd = false,
             cmdheight = 1,
           },
           top = {
             showtabline = 0,
           },
           left = {
             number = false,
             relativenumber = false,
             signcolumn = "no",
           },
         },
         modes = {
           ataraxis = {
             left_padding = 32,
             right_padding = 32,
             top_padding = 1,
             bottom_padding = 1,
             ideal_writing_area_width = {0},
             auto_padding = true,
             keep_default_fold_fillchars = true,
             custom_bg = {"none", ""},
             bg_configuration = true,
             quit = "untoggle",
             ignore_floating_windows = true,
             affected_higroups = {
               NonText = true,
               FoldColumn = true,
               ColorColumn = true,
               VertSplit = true,
               StatusLine = true,
               StatusLineNC = true,
               SignColumn = true,
             },
           },
           focus = {
             margin_of_error = 5,
             focus_method = "experimental"
           },
         },
         integrations = {
           vim_gitgutter = false,
           galaxyline = false,
           tmux = true,
           gitsigns = false,
           vim_bufferline = false,
           limelight = false,
           twilight = false,
           vim_airline = false,
           vim_powerline = false,
           vim_signify = false,
           express_line = false,
           lualine = false,
           lightline = false,
           feline = false
         },
         misc = {
           on_off_commands = false,
           ui_elements_commands = false,
           cursor_by_mode = false,
         }
       })
    end,
    
    -- LSP-installer: allows you to seamlessly manage LSP servers locally
    "williamboman/nvim-lsp-installer",
    config = function()
      local lsp_installer = require "nvim-lsp-installer"
      
      lsp_installer.settings({
        ui = {
          icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
          }
        }
      })

      lsp_installer.on_server_ready(function(server)
        local opts = {}
        
        server:setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
      end)
    end,
   }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"

