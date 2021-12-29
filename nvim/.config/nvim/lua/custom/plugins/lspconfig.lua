local M = {}
M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- pyright server configuration
   lspconfig.pyright.setup {
     cmd = { "/home/dsilva/.local/share/nvim/lsp_servers/python/node_modules/pyright/langserver.index.js", "--stdio" }, 
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
     cmd = { "/home/dsilva/.local/share/nvim/lsp_servers/dockerfile/node_modules/dockerfile-language-server-nodejs/bin/docker-langserver", "--stdio" },
     on_attach = attach,
     capabilities = capabilities,
     flags = {
       debounce_text_changes = 150,
     },
   }
  
   -- ltex server configuration
   lspconfig.ltex.setup {
     cmd = { "/home/dsilva/.local/share/nvim/lsp_servers/ltex/ltex-ls-15.2.0/bin/ltex-ls" },
     on_attach = attach,
     capabilities = capabilities,
     flags = {
       debounce_text_changes = 150,
     },
   }

   -- texlab server configuration
   lspconfig.texlab.setup {
    cmd = { "/home/dsilva/.local/share/nvim/lsp_servers/latex/texlab" },
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
