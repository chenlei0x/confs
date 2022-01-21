local vim = vim
M = {}
local function get_symbol()
    local currentWord = vim.fn.expand('<cword>')
    return currentWord
end

local function cs_find_cword_def()
    local current_word = get_symbol()
    vim.cmd("lcs find g " .. current_word)
end

local function cs_find_cword_ref()
    local current_word = get_symbol()
    vim.cmd("lcs find s " .. current_word)
end

local function try_to_add_cscope_db()
    vim.api.nvim_exec([[
        set csto=0
        set cst
        set cscopequickfix=s-,c-,d-,i-,t-,e-
        if filereadable("cscope.out")
            cs add cscope.out
        endif
        set csverb
    ]], true)
end
try_to_add_cscope_db()
return {
    cs_find_cword_def = cs_find_cword_def,
    cs_find_cword_ref = cs_find_cword_ref,
}
