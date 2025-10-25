local Plugin = {'nvim-treesitter/nvim-treesitter'}

Plugin.main = 'nvim-treesitter.configs'

Plugin.version = "^0.9.2"

Plugin.dependencies = {
  {'nvim-treesitter/nvim-treesitter-textobjects'}
}

Plugin.opts = {
    auto_install = true,
    ensure_installed = { "cpp", "javascript", "typescript",
  	                     "c", "lua", "vim", "vimdoc", "go" },
    highlight = {
        enable = true,
        disable = function(lang, buf)
            -- There is probably bug with HTML parser causing nvim to crash silently.
            if lang == "html" then
                return true
            end
            return false
        end
    },
}

return Plugin
