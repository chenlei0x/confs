local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
    -- Vim map
    ["n|<A-d>"] = map_cr("bdelete"):with_noremap():with_silent(),
    ["n|<A-D>"] = map_cr("bdelete!"):with_noremap():with_silent(),
    ["n|<leader>bw"] = map_cr("bwipe"):with_noremap():with_silent(),
    ["n|<leader>l"] = map_cr("write"):with_noremap():with_silent(),

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

    --tab
    ["n|<leader>tn"] = map_cr("tabnew"):with_silent(),
    ["n|<A-t>"] = map_cr("tabclose"):with_silent(),
    ["n|<A-,>"] = map_cr("tabp"):with_silent(),
    ["n|<A-.>"] = map_cr("tabn"):with_silent(),
    ["n|<leader>tt"] = map_cr("tabe %"):with_silent(),
    -- window
    ["n|<leader>s"] = map_cr("split"):with_silent(),
    ["n|<leader>v"] = map_cr("vsplit"):with_silent(),
    ["n|<A-w>"] = map_cmd("<c-w>c"):with_silent():with_noremap(),
    ["n|<TAB>"] = map_cmd("<c-w>w"):with_silent():with_noremap(),

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

    -- quickfix window
    ["n|<F3>"] = map_cr("lprev"):with_noremap(),
    ["n|<F4>"] = map_cr("lnext"):with_noremap(),

    -- cscope
    ["n|<leader><leader>s"] = map_cmd(":cs f s "):with_noremap(),
    ["n|<leader><leader>g"] = map_cmd(":cs f g "):with_noremap(),
    ["n|<leader>cg"] = map_cr('lua require("core.cscope"):cs_find_cword_def()'):with_noremap():with_silent(),
    ["n|<leader>cs"] = map_cr('lua require("core.cscope"):cs_find_cword_ref()'):with_noremap():with_silent(),

    ["n|<M-q>"] = map_cr("q")
}

bind.nvim_load_mapping(def_map)
