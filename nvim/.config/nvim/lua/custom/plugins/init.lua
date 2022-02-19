-- Plugins file

return {
  {
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
  },
  {
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
  },
  {
    -- Stabilize: a plugin to stabilize window open/close events
    "luukvbaal/stabilize.nvim",
    config = function() require("stabilize").setup() end
  },
  {
    -- capslock.vim: Software caps lock
    "tpope/vim-capslock"
  }
}
