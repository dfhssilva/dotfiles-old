-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

--------------------------------------------------------------------

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event', 'cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough

-- Set maplocalleader to "," instead of the "\" default
vim.g.maplocalleader = ','

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
    -- Stabilize: a plugin to stabilize window open/close events
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  }

  use {
    -- Todo.txt: a Vim plugin for Todo.txt
    "freitass/todo.txt-vim"
  }
end)

-- MAPPINGS
local map = require("core.utils").map

-- Launch todo.txt file with key combination
local handle = io.popen('source $TODOTXT_CFG_FILE; echo $TODO_DIR/todo.txt')
local todo_file = handle:read("*a"); handle:close()
map("n", "<leader>t", string.format(":edit %s<CR>", todo_file))

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
