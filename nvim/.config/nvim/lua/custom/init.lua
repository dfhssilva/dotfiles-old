-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

--------------------------------------------------------------------

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event', 'cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough

-- PLUGINS
local customPlugins = require "core.customPlugins"
customPlugins.add(function(use)
  use {
    -- AutoSave: saving your work before the world collapses
    "Pocco81/AutoSave.nvim",
    config = function()
      local autosave = require "autosave"
      autosave.setup {
        enabled = true,
        execution_message = " at: " .. vim.fn.strftime("%H:%M:%S"),
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
          ["core.keybinds"] = { -- Configure core.keybinds
            config = {
              default_keybinds = true, -- Generate the default keybinds
            }
          },
          ["core.norg.concealer"] = {}, -- Allows for use of icons
          ["core.norg.dirman"] = { -- Manage your directories with Neorg
            config = {
              workspaces = {
                notes = "~/neorg/notes",
                gtd = "~/neorg/gtd"
              }
            }
          },
          ["core.gtd.base"] = {  -- Add "Getting Things Done" methodology support
            config = {
              workspace = 'gtd',
              default_lists = {
                inbox = "inbox.norg",
              }
            }
          },
          ["core.integrations.telescope"] = {}, -- Enable the telescope module
        }
      }
    end,
    requires = { "nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope" },
    -- No lazy-load: "Neorg practically lazy loads itself - only a few lines of code are
    -- run on startup, these lines check whether the current extension is .norg, if it's
    -- not then nothing else loads"
  }

  use {
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  }
end)

-- MAPPINGS
local map = require("core.utils").map

-- Launch Neorg with key combination
map("n", "<leader>fo", ":NeorgStart <CR>")
-- Set lspconfig mapping because of bug happening where keybinds wouldn't load
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")
map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>")
