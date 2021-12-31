local M = {}
M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   local lsp_server_path = "~/.local/share/nvim/lsp_servers/"

   -- pyright server configuration
   lspconfig.pyright.setup {
     cmd = { lsp_server_path .. "python" },
     on_attach = attach,
     capabilities = capabilities,
     flags = {
       debounce_text_changes = 150,
     },
     settings = {
       python = {
         analysis = {
           useLibraryCodeForTypes = true
         },
         venvPath = "/home/dsilva/miniconda3/envs"
       }
     }
   }

   -- dockerls server configuration
   lspconfig.dockerls.setup {
     cmd = { lsp_server_path .. "dockerfile" },
     on_attach = attach,
     capabilities = capabilities,
     flags = {
       debounce_text_changes = 150,
     },
   }

   -- ltex server configuration
   lspconfig.ltex.setup {
     cmd = { lsp_server_path .. "ltex" },
     on_attach = attach,
     capabilities = capabilities,
     flags = {
       debounce_text_changes = 150,
     },
   }

   -- sumneko_lua server configuration
   lspconfig.sumneko_lua.setup {
     cmd = { lsp_server_path .. "sumneko_lua" },
     on_attach = attach,
     capabilities = capabilities,
     flags = {
       debounce_text_changes = 150,
     },
   }

   -- texlab server configuration
   lspconfig.texlab.setup {
    cmd = { lsp_server_path .. "latex" },
    on_attach = attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      texlab = {
        build = {
          args = { '%f', '--keep-logs', '--keep-intermediates' },
          executable = '/usr/bin/tectonic',
          }
        }
      }
    }

end

return M
