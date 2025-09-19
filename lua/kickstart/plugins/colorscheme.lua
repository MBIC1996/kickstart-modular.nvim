return {
  {
    'darianmorat/gruvdark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- Set an overall theme
      vim.cmd.colorscheme 'gruvdark'

      -- attempting to change rules for VHDL to be more like sigasi's highlighting
      vim.api.nvim_set_hl(0, '@module', { fg = '#4ec9b0', bold = false })
      vim.api.nvim_set_hl(0, '@module.builtin.vhdl', { fg = '#4ec9b0', bold = false })
      vim.api.nvim_set_hl(0, '@module.vhdl', { fg = '#4EC9B0', bold = false })
      vim.api.nvim_set_hl(0, '@property.vhdl', { fg = '#4EC9B0', bold = false })
      vim.api.nvim_set_hl(0, '@type', { fg = '#4EC9B0', bold = false })
      vim.api.nvim_set_hl(0, '@type.vhdl', { fg = '#4EC9B0', bold = false })
      vim.api.nvim_set_hl(0, '@type.builtin.vhdl', { fg = '#4EC9B0', bold = false })

      vim.api.nvim_set_hl(0, '@attribute.builtin.vhdl', { fg = '#EACD95', bold = false })

      vim.api.nvim_set_hl(0, '@number', { fg = '#B5CEA8', bold = false })
      vim.api.nvim_set_hl(0, '@number.vhdl', { fg = '#B5CEA8', bold = false })

      vim.api.nvim_set_hl(0, '@comment', { fg = '#6A9955', bold = false })
      vim.api.nvim_set_hl(0, '@spell', { fg = '#6A9955', bold = false })

      vim.api.nvim_set_hl(0, '@function', { fg = '#DCDCAA', bold = false })
      vim.api.nvim_set_hl(0, '@function.vhdl', { fg = '#DCDCAA', bold = false })
      vim.api.nvim_set_hl(0, '@function.builtin.vhdl', { fg = '#DCDCAA', bold = false })

      vim.api.nvim_set_hl(0, '@keyword', { fg = '#C586C0', bold = false })
      vim.api.nvim_set_hl(0, '@keyword.repeat', { fg = '#C586C0', bold = false })
      vim.api.nvim_set_hl(0, '@keyword.import', { fg = '#C586C0', bold = false })
      vim.api.nvim_set_hl(0, '@keyword.return.vhdl', { fg = '#C586C0', bold = false })
      vim.api.nvim_set_hl(0, '@keyword.vhdl', { fg = '#C586C0', bold = false })
      vim.api.nvim_set_hl(0, '@keyword.modifier', { fg = '#C586C0', bold = false })
      vim.api.nvim_set_hl(0, '@keyword.type', { fg = '#C586C0', bold = false })
      vim.api.nvim_set_hl(0, '@keyword.operator', { fg = '#C586C0', bold = false })
      vim.api.nvim_set_hl(0, '@keyword.function.vhdl', { fg = '#C586C0', bold = false })
      vim.api.nvim_set_hl(0, '@label', { fg = '#C586C0', bold = false })
      vim.api.nvim_set_hl(0, '@label.vhdl', { fg = '#C586C0', bold = false })
      vim.api.nvim_set_hl(0, '@constant.builtin.vhdl', { fg = '#C586C0', bold = false })

      vim.api.nvim_set_hl(0, '@operator.vhdl', { fg = '#9CDCFE', bold = false })

      vim.api.nvim_set_hl(0, '@operator', { fg = '#d6cfc4', bold = false })
      vim.api.nvim_set_hl(0, '@operator.lua', { fg = '#d6cfc4', bold = false })
      vim.api.nvim_set_hl(0, '@punctuation.lua', { fg = '#d6cfc4', bold = false })
      vim.api.nvim_set_hl(0, '@punctuation.delimiter.lua', { fg = '#d6cfc4', bold = false })

      vim.api.nvim_set_hl(0, '@variable.vhdl', { fg = '#3F9ACC', bold = false })
      vim.api.nvim_set_hl(0, '@variable', { fg = '#3F9ACC', bold = false })
      -- Generics get italics for clarity
      vim.api.nvim_set_hl(0, '@variable.parameter.vhdl', { fg = '#E5C07B', italic = true })

      vim.api.nvim_set_hl(0, '@string.vhdl', { fg = '#CE9178', bold = false })
      vim.api.nvim_set_hl(0, '@string', { fg = '#CE9178', bold = false })
      vim.api.nvim_set_hl(0, '@string.lua', { fg = '#CE9178', bold = false })
      -- normal white
      vim.api.nvim_set_hl(0, '@field', { fg = '#d6cfc4', bold = false })
      vim.api.nvim_set_hl(0, '@field.lua', { fg = '#d6cfc4', bold = false })

      vim.api.nvim_set_hl(0, '@boolean.vhdl', { fg = '#E5C07B', bold = false })
    end,
  },
}
