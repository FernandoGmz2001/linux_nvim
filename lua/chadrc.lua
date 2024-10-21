local M = {}

M.base46 = {
    theme = "onedark",
    transparent = true,
}

M.ui = {
    -- statusline = { theme = "vscode"},
    cmp = {
        lspkind_text = true,
        icons_left=false,
        style = "default",
        format_colors = {
            tailwind = true
        }
    }
}
return M
