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
end

return M
