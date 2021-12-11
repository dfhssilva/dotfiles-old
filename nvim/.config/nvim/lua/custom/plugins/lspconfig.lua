local M = {}
M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "pyright", "dockerls", "ltex" }
   
   -- lspservers executables - NEEDS TO SPECIFY THE EXECUTABLE FOR EVERY SERVER
   local executables = { 
     { "/home/dsilva/.local/share/nvim/lsp_servers/python/node_modules/pyright/langserver.index.js", "--stdio" }, 
     { "/home/dsilva/.local/share/nvim/lsp_servers/dockerfile/node_modules/dockerfile-language-server-nodejs/bin/docker-langserver", "--stdio" },
     { "/home/dsilva/.local/share/nvim/lsp_servers/ltex/ltex-ls-15.2.0/bin/ltex-ls" }
   }
   
   -- lspservers default configurations
   for i, lsp in ipairs(servers) do
     lspconfig[lsp].setup {
       cmd = executables[i],
       on_attach = attach,
       capabilities = capabilities,
       flags = {
         debounce_text_changes = 150,
       },
     }
   end
  
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
