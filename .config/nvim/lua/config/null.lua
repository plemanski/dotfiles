local null = require("null-ls")

local formatting = null.builtins.formatting
local diag = null.builtins.diagnostics
local actions = null.builtins.code_actions
local completion = null.builtins.completion
local hover = null.builtins.hover

null.setup{
    sources = {
        actions.eslint_d,
        formatting.shellharden        
    }
}
