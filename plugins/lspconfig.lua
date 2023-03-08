local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require 'lspconfig.util'

local lspconfig = require "lspconfig"
local util = lspconfig.util
local root_files = {
    '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json',
    'compile_flags.txt', '.git', 'configure.ac' -- AutoTools
}
local default_capabilities = {
    textDocument = {completion = {editsNearCursor = true}},
    offsetEncoding = {'utf-8', 'utf-16'}
}

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = {noremap = true, silent = true, buffer = bufnr}
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
                   bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)

    require"lsp_signature".on_attach({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        handler_opts = {border = "rounded"}
    }, bufnr)
end

lspconfig['clangd'].setup {
    cmd = {'clangd', "--background-index", "--compile-commands-dir=build"},
    on_attach = on_attach,
    capabilities = default_capabilities,
    single_file_support = true,
    filetypes = {'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto'},
    root_dir = function(fname)
        return util.root_pattern(unpack(root_files))(fname) or
                   util.find_git_ancestor(fname)
    end
}

lspconfig['cmake'].setup {
    filetypes = {'cmake'},
    init_options = {buildDirectory = "build"}
}
