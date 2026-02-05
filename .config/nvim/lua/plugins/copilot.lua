local Plugin = { 'zbirenbaum/copilot.lua' }

Plugin.opts = {}

function Plugin.init()
    vim.g.copilot_no_tab_map = true
    -- We have to do this as raw vim script because using lua remap
    -- causes an escape characters to be inserted at the end.
    vim.cmd('imap <silent><script><expr> <C-J> copilot#Accept("\\<CR>")')
end

return Plugin
