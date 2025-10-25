local Plugin = {'nvim-telescope/telescope.nvim'}

Plugin.version = '^0.1.8'

Plugin.dependencies = {
    {'nvim-lua/plenary.nvim'},
}

Plugin.cmd = {'Telescope'}

Plugin.opts = {
    pickers = {
        live_grep = {
            additional_args = function(opts)
                -- search in CI files (.github, .gitlab-ci.yml, etc.)
                return {'--hidden', '--glob', '!.git/*'}
            end
        },
    },
}

function Plugin.init()
    local ts = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', ts.find_files, {})
    vim.keymap.set('n', '<C-p>', ts.git_files, {})
    vim.keymap.set('n', '<leader>pg', ts.live_grep, {})
    vim.keymap.set('n', '<leader>pb', ts.buffers, {})
end

return Plugin
