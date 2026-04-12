local Plugin = {'nvim-treesitter/nvim-treesitter'}

Plugin.main = 'nvim-treesitter'

Plugin.version = "^10.0.0"

Plugin.dependencies = {
  {'nvim-treesitter/nvim-treesitter-textobjects'}
}

Plugin.init = function()
  vim.api.nvim_create_autocmd('FileType', { 
    callback = function() 
      -- Enable treesitter highlighting and disable regex syntax
      pcall(vim.treesitter.start) 
      -- Enable treesitter-based indentation
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" 
    end, 
  }) 
end

Plugin.opts = {
    auto_install = true,
    ensure_installed = { "cpp", "javascript", "typescript",
  	                     "c", "lua", "vim", "vimdoc", "go" },
}

return Plugin
