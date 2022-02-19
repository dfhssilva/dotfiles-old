-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

--------------------------------------------------------------------

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event', 'cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough

-- Set maplocalleader to "," instead of the "\" default
vim.g.maplocalleader = ','

-- MAPPINGS
local map = require("core.utils").map

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
