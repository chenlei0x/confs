local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require("keymap.config")

local plug_map = {
    -- Bufferline
    ["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
    ["n|<A-j>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
    ["n|<A-k>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
    ["n|<A-1>"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
    ["n|<A-2>"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
    ["n|<A-3>"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
    ["n|<A-4>"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
    ["n|<A-5>"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
    ["n|<A-6>"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
    ["n|<A-7>"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
    ["n|<A-8>"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
    ["n|<A-9>"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
    -- Packer
    ["n|<leader>ps"] = map_cr("PackerSync"):with_silent():with_noremap()
        :with_nowait(),
    ["n|<leader>pu"] = map_cr("PackerUpdate"):with_silent():with_noremap()
        :with_nowait(),
    ["n|<leader>pi"] = map_cr("PackerInstall"):with_silent():with_noremap()
        :with_nowait(),
    ["n|<leader>pc"] = map_cr("PackerClean"):with_silent():with_noremap()
        :with_nowait(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>li"] = map_cr(":LspInfo"):with_noremap():with_silent()
        :with_nowait(),
    ["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent()
        :with_nowait(),
    ["n|g["] = map_cr("Lspsaga diagnostic_jump_next"):with_noremap()
        :with_silent(),
    ["n|g]"] = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap()
        :with_silent(),
    ["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|<C-j>"] = map_cr(
        "lua require('lspsaga.action').smart_scroll_with_saga(-1)"):with_noremap()
        :with_silent(),
    ["n|<C-k>"] = map_cr(
        "lua require('lspsaga.action').smart_scroll_with_saga(1)"):with_noremap()
        :with_silent(),
    ["n|gd"] = map_cr("Lspsaga preview_definition"):with_noremap():with_silent(),
    ["n|gD"] = map_cr("lua vim.lsp.buf.definition()"):with_noremap()
        :with_silent(),
    ["n|gs"] = map_cr("Lspsaga signature_help"):with_noremap():with_silent(),
    ["n|gt"] = map_cr("Lspsaga rename"):with_noremap():with_silent(),
    ["n|gr"] = map_cr("lua vim.lsp.buf.references()"):with_noremap()
        :with_silent(),
    -- FTERM
    ["n|<A-d>"] = map_cu('lua require("FTerm").toggle()'):with_noremap()
        :with_silent(),
    ["t|<A-d>"] = map_cu([[<C-\><C-n><CMD>lua require("FTerm").toggle()]]):with_noremap()
        :with_silent(),
    ["t|<A-S-d>"] = map_cu([[<C-\><C-n><CMD>lua require("FTerm").exit()]]):with_noremap()
        :with_silent(),
    --["n|<Leader>g"] = map_cu("lua require('FTerm').run('gitui')"):with_noremap():with_silent(),


    -- Plugin nvim-tree
    ["n|<C-n>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
    
    -- Plugin Telescope
    ["n|<Leader>fe"] = map_cu("DashboardFindHistory"):with_noremap()
        :with_silent(),
    ["n|<Leader>b"] = map_cu("Telescope buffers"):with_noremap():with_silent(),
    ["n|<c-p>"] = map_cu("DashboardFindFile"):with_noremap():with_silent(),
    ["n|<Leader>fw"] = map_cu("DashboardFindWord"):with_noremap():with_silent(),
    ["n|<Leader>fb"] = map_cu("Telescope file_browser"):with_noremap()
        :with_silent(),
    ["n|<Leader>fg"] = map_cu("Telescope live_grep"):with_noremap()
        :with_silent(),
    ["n|<Leader>fs"] = map_cu("Telescope lsp_dynamic_workspace_symbols"):with_noremap()
        :with_silent(),
    ["n|<Leader>fc"] = map_cu("Telescope current_buffer_fuzzy_find"):with_noremap()
        :with_silent(),

    -- Plugin accelerate-jk
    ["n|j"] = map_cmd("v:lua.enhance_jk_move('j')"):with_silent():with_expr(),
    ["n|k"] = map_cmd("v:lua.enhance_jk_move('k')"):with_silent():with_expr(),
    -- Plugin Hop
    ["n|<leader>hw"] = map_cu("HopWord"):with_noremap(),
    ["n|<leader>hl"] = map_cu("HopLine"):with_noremap(),
    ["n|<leader>hh"] = map_cu("HopChar1"):with_noremap(),
    ["n|<leader>hs"] = map_cu("HopChar2"):with_noremap(),
    
    -- Plugin SymbolsOutline
    ["n|<A-t>"] = map_cr("SymbolsOutline"):with_noremap():with_silent(),
    -- Plugin split-term
    ["n|<F5>"] = map_cr("VTerm"):with_noremap():with_silent(),

    -- Plugin MarkdownPreview
    ["n|<F12>"] = map_cr("MarkdownPreviewToggle"):with_noremap():with_silent(),
    -- Plugin SnipRun
    ["v|<leader>r"] = map_cr("SnipRun"):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)
