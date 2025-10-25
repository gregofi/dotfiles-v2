local Plugin = { "CopilotC-Nvim/CopilotChat.nvim" }

Plugin.branch = "canary"

Plugin.dependencies = {
  { "github/copilot.vim" }, -- or github/copilot.vim
  { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
}

Plugin.opts = {
  debug = true, -- Enable debugging
}

local function CC()
    return require("CopilotChat")
end

Plugin.keys = {
    { "<leader>cct", function() return CC().toggle() end },
    { "<leader>ccf", function() return CC().toggle({
        window = {
            layout = "float",
        }
    }) end },
    { "<leader>ccr", function() return CC().reset() end },
    { "<leader>cca", function() return CC().ask("Explain how does this work", {
            selection = require("CopilotChat.select").buffer,
        })
    end
    }
}

return Plugin
