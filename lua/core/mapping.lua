local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
    -- Vim map
    ["n|<c-q>"] = map_cr("bdelete"):with_noremap():with_silent(),
    ["n|<C-s>"] = map_cu("write"):with_noremap(),

    -- when searching， zz makes cursor line in the middle
    ["n|n"] = map_cmd("nzzzv"):with_noremap(),
    ["n|N"] = map_cmd("Nzzzv"):with_noremap(),
    --["n|J"] = map_cmd("mzJ`z"):with_noremap(),
    --["n|<C-h>"] = map_cmd("<C-w>h"):with_noremap(),
    --["n|<C-l>"] = map_cmd("<C-w>l"):with_noremap(),
    --["n|<C-j>"] = map_cmd("<C-w>j"):with_noremap(),
    --["n|<C-k>"] = map_cmd("<C-w>k"):with_noremap(),
    ["n|<A-[>"] = map_cr("vertical resize -5"):with_silent(),
    ["n|<A-]>"] = map_cr("vertical resize +5"):with_silent(),
    ["n|<A-;>"] = map_cr("resize -2"):with_silent(),
    ["n|<A-'>"] = map_cr("resize +2"):with_silent(),
    ["n|<A-q>"] = map_cmd(":bw<CR>"),
    ["n|<A-S-q>"] = map_cmd(":bw!<CR>"),
    ["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"),

    --tab
    ["n|<leader>tn"] = map_cr("tabnew"):with_silent(),
    ["n|<leader>tc"] = map_cr("tabclose"):with_silent(),
    ["n|<leader>u"] = map_cr("tabp"):with_silent(),
    ["n|<leader>i"] = map_cr("tabn"):with_silent(),
    ["n|<leader>tt"] = map_cr("tabe %"):with_silent(),
    -- window
    ["n|<leader>s"] = map_cr("split"):with_silent(),
    ["n|<leader>v"] = map_cr("vsplit"):with_silent(),
    ["n|<leader>wc"] = map_cmd("<c-w>c"):with_silent():with_noremap(),

    -- Insert
    -- ["i|<C-u>"] = map_cmd("<C-G>u<C-U>"):with_noremap(),
    -- ["i|<C-a>"] = map_cmd("<ESC>^i"):with_noremap(),
    ["i|<C-s>"] = map_cmd("<Esc>:w<CR>"),
    ["i|<C-q>"] = map_cmd("<Esc>:wq<CR>"),
    -- command line
    ["c|<C-b>"] = map_cmd("<Left>"):with_noremap(),
    ["c|<C-f>"] = map_cmd("<Right>"):with_noremap(),
    ["c|<C-a>"] = map_cmd("<Home>"):with_noremap(),
    ["c|<C-e>"] = map_cmd("<End>"):with_noremap(),
    ["c|<C-d>"] = map_cmd("<Del>"):with_noremap(),
    ["c|<C-h>"] = map_cmd("<BS>"):with_noremap(),
    ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
    -- ["c|w!!"] = map_cmd("execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),
    -- Visual
    ["v|J"] = map_cmd(":m '>+1<cr>gv=gv"),
    ["v|K"] = map_cmd(":m '<-2<cr>gv=gv"),

    -- 
}

bind.nvim_load_mapping(def_map)
