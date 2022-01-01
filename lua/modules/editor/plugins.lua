local editor = {}
local conf = require("modules.editor.config")

editor["junegunn/vim-easy-align"] = {opt = true, cmd = "EasyAlign"}

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

editor["akinsho/nvim-toggleterm.lua"] = {
    opt = false,
    config = conf.toggleterm
}
editor["numtostr/FTerm.nvim"] = {opt = false}
editor["norcalli/nvim-colorizer.lua"] = {
    opt = true,
    event = "BufRead",
    config = conf.nvim_colorizer
}

editor["jdhao/better-escape.vim"] = {opt = true, event = "InsertEnter"}

editor["RRethy/vim-illuminate"] = {
    opt = true,
    config = conf.vim_illuminate
}

editor["jlanzarotta/bufexplorer"] = {
    opt = false,
}

editor["blackCauldron7/surround.nvim"] = {
    opt = false,
    config = function () require"surround".setup {mappings_style = "sandwich"} end
}


editor["numToStr/Comment.nvim"] = {
    opt = false,
    config = function() require('Comment').setup() end
}
return editor
