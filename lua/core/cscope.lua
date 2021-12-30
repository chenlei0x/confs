local vim = vim
M = {}
local function get_symbol()
    local currentWord = vim.fn.expand('<cword>')
    return currentWord
end

local function cs_find_cword_def()
    local current_word = get_symbol()
    vim.cmd("cs find g " .. current_word)
end

local function cs_find_cword_ref()
    local current_word = get_symbol()
    vim.cmd("cs find s " .. current_word)
end

return {
    cs_find_cword_def = cs_find_cword_def,
    cs_find_cword_ref = cs_find_cword_ref
}