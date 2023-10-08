
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.bars-and-lines.heirline-mode-text-statusline" },
  -- { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  { "nvim-lualine/lualine.nvim",
    requires = {
      'nvim-tree/nvim-web-devicons',
      'linrongbin16/lsp-progress.nvim',
    },
    config = function()
      local empty = require('lualine.component'):extend()
      function empty:draw(default_highlight)
        self.status = ''
        self.applied_separator = ''
        self:apply_highlights(default_highlight)
        self:apply_section_separators()
        return self.status
      end

      -- Put proper separators and gaps between components in sections
      local function process_sections(sections)
        for name, section in pairs(sections) do
          local left = name:sub(9, 10) < 'x'
          for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
            table.insert(section, pos * 2, { empty })
          end
          for id, comp in ipairs(section) do
            if type(comp) ~= 'table' then
              comp = { comp }
              section[id] = comp
            end
            comp.separator = left and { right = '' } or { left = '' }
          end
        end
        return sections
      end
      
      local function search_result()
        if vim.v.hlsearch == 0 then
          return ''
        end
        local last_search = vim.fn.getreg('/')
        if not last_search or last_search == '' then
          return ''
        end
        local searchcount = vim.fn.searchcount { maxcount = 9999 }
        return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
      end
      
      local function modified()
        if vim.bo.modified then
          return '+'
        elseif vim.bo.modifiable == false or vim.bo.readonly == true then
          return '-'
        end
        return ''
      end

      local function LspIcon()
        local active_clients_count = #vim.lsp.get_active_clients()
        return active_clients_count > 0 and " LSP" or ""
      end

      local function LspStatus()
        return require("lsp-progress").progress({
          format = function(messages)
              return #messages > 0 and table.concat(messages, " ") or ""
            end,
        })
      end

      require('lualine').setup {
        options = {
          theme = "catppuccin",
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = process_sections {
          lualine_a = { 'mode' },
          lualine_b = {
            'branch',
            'diff',
            {
              'diagnostics',
              source = { 'nvim' },
              sections = { 'error' },
            },
            {
              'diagnostics',
              source = { 'nvim' },
              sections = { 'warn' },
            },
            { 'filename', file_status = false, path = 1 },
            {
              '%w',
              cond = function()
                return vim.wo.previewwindow
              end,
            },
            {
              '%r',
              cond = function()
                return vim.bo.readonly
              end,
            },
            {
              '%q',
              cond = function()
                return vim.bo.buftype == 'quickfix'
              end,
            },
          },
          lualine_c = {
            LspIcon,
            LspStatus,
          },
          lualine_x = {},
          lualine_y = { search_result, 'filetype' },
          lualine_z = { '%l:%c', '%p%%/%L' },
        },
        inactive_sections = {
          lualine_c = { '%f %y %m' },
          lualine_x = {},
        },
      }

      -- listen lsp-progress event and refresh lualine
      vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = "lualine_augroup",
        pattern = "LspProgressStatusUpdated",
        callback = require("lualine").refresh,
      })
    end,
  },
}
