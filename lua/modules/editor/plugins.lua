local editor = {}
local conf = require("modules.editor.config")

editor["junegunn/vim-easy-align"] = {opt = true, cmd = "EasyAlign"}
editor["itchyny/vim-cursorword"] = {
    opt = true,
    event = {"BufReadPre", "BufNewFile"},
    config = conf.vim_cursorwod
}

editor["simrat39/symbols-outline.nvim"] = {
    opt = true,
    cmd = {"SymbolsOutline", "SymbolsOutlineOpen"},
    config = conf.symbols_outline
}
editor["nvim-treesitter/nvim-treesitter"] = {
    opt = true,
    run = ":TSUpdate",
    event = "BufRead",
    config = conf.nvim_treesitter
}

editor["nvim-treesitter/nvim-treesitter-textobjects"] = {
    opt = true,
    after = "nvim-treesitter"
}
editor["romgrk/nvim-treesitter-context"] = {
    opt = true,
    after = "nvim-treesitter"
}
editor["p00f/nvim-ts-rainbow"] = {
    opt = true,
    after = "nvim-treesitter",
    event = "BufRead"
}
editor["SmiteshP/nvim-gps"] = {
    opt = true,
    after = "nvim-treesitter",
    config = conf.nvim_gps
}
editor["rhysd/accelerated-jk"] = {opt = true}
editor["romainl/vim-cool"] = {
    opt = true,
    event = {"CursorMoved", "InsertEnter"}
}
editor["phaazon/hop.nvim"] = {
    opt = true,
    branch = "v1",
    cmd = {
        "HopLine", "HopLineStart", "HopWord", "HopPattern", "HopChar1",
        "HopChar2"
    },
    config = function()
        require("hop").setup {keys = "etovxqpdygfblzhckisuran"}
    end
}

editor["vimlab/split-term.vim"] = {opt = true, cmd = {"Term", "VTerm"}}
editor["akinsho/nvim-toggleterm.lua"] = {
    opt = true,
    event = "BufRead",
    config = conf.toggleterm
}
editor["numtostr/FTerm.nvim"] = {opt = true, event = "BufRead"}
editor["norcalli/nvim-colorizer.lua"] = {
    opt = true,
    event = "BufRead",
    config = conf.nvim_colorizer
}

editor["jdhao/better-escape.vim"] = {opt = true, event = "InsertEnter"}
return editor
