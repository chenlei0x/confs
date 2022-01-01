local vim = vim

local function prepare_hl_groups()
    vim.cmd("highlight symbol_1 ctermbg=green guibg=Red")
    vim.cmd("highlight symbol_2 ctermbg=Cyan guibg=Green")
    vim.cmd("highlight symbol_3 ctermfg=235 ctermbg=176 guifg=#2b2d37 guibg=#d38aea")
    vim.cmd("highlight symbol_4 ctermfg=235 ctermbg=107")
    vim.cmd("highlight symbol_5 cterm=bold ctermfg=235 ctermbg=203")
end

local function get_symbol()
    local currentWord = vim.fn.expand('<cword>')
    return currentWord
end

-- {symbol : {group_no, matchadd_id}}
local symbol_group_dict = {}
local free_groups = {true, true, true, true, true}

local function pick_group(symbol)
    local ret = nil
    if symbol_group_dict[symbol] ~= nil then
        return symbol_group_dict[symbol].group_no
    end

    for group_no, is_free, v in pairs(free_groups) do
        if is_free == true then
            free_groups[group_no] = false
            symbol_group_dict[symbol].group_no = group_no
            ret = group_no
            break
        end
    end

    print(string.format("allocate hi group %d for symbol %s", ret, symbol))
    return ret
end

local function free_group(symbol)
    local group_no = symbol_group_dict[symbol]

    if group_no == nil then
        print("symbol " .. symbol .. "is not highlighted")
        return
    end

    print(string.format("symbol %s and hl group %d is freed", symbol, group_no))

    symbol_group_dict[symbol] = nil
    free_group[group_no] = true
end

local function match_add(symbol, group_no)
    local cmd_line = string.format([[call matchadd("symbol_%d", '\<%s\>')]], group_no, symbol)
    local matchadd_id = vim.cmd(cmd_line)
    return matchadd_id
end

local function high_light_curr_word()
    local symbol = get_symbol()
    local group_no = pick_group(symbol)
    local matchadd_id = match_add(symbol, group_no)
    symbol_group_dict[symbol] = {group_no = group_no, matchadd_id = matchadd_id, status = "enable"}
end

local function disable_all_highlight()
    for symbol, info in symbol_group_dict do
        if info.status == "enable" then
            local matchadd_id = info.matchadd_id
            vim.fn.matchdelete(matchadd_id)
            info.status = "disable"
            info.matchadd_id = nil
        end
    end
end

local function enable_all_highlight()
    for symbol, info in symbol_group_dict do
        if info.status == "enable" then
            local matchadd_id = info.matchadd_id
            vim.fn.matchdelete(matchadd_id)
            info.status = "disable"
        end
    end
end


local function print_symbol_group()
    print(vim.inspect(symbol_group_dict))
end

return {
    high_light_curr_word = high_light_curr_word,
    print_symbol_group = print_symbol_group,
}

-- nvim_win_set_var({window}, {name}, {value})  
-- win_getid()