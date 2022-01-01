local config = {}
local dap_dir = vim.fn.stdpath("data") .. "/dapinstall/"
local sessions_dir = vim.fn.stdpath("data") .. "/sessions/"

function config.symbols_outline()
    require("symbols-outline").setup({
        highlight_hovered_item = true,
        width = 60,
        show_guides = true,
        auto_preview = true,
        position = "right",
        show_numbers = true,
        show_relative_numbers = true,
        show_symbol_details = true,
        preview_bg_highlight = 'Pmenu',
        keymaps = {
            close = "<Esc>",
            goto_location = "<Cr>",
            focus_location = "o",
            hover_symbol = "<C-space>",
            rename_symbol = "r",
            code_actions = "a"
        },
        lsp_blacklist = {},
        symbols = {
            File = {icon = "", hl = "TSURI"},
            Module = {icon = "", hl = "TSNamespace"},
            Namespace = {icon = "", hl = "TSNamespace"},
            Package = {icon = "", hl = "TSNamespace"},
            Class = {icon = "𝓒", hl = "TSType"},
            Method = {icon = "ƒ", hl = "TSMethod"},
            Property = {icon = "", hl = "TSMethod"},
            Field = {icon = "", hl = "TSField"},
            Constructor = {icon = "", hl = "TSConstructor"},
            Enum = {icon = "ℰ", hl = "TSType"},
            Interface = {icon = "ﰮ", hl = "TSType"},
            Function = {icon = "", hl = "TSFunction"},
            Variable = {icon = "", hl = "TSConstant"},
            Constant = {icon = "", hl = "TSConstant"},
            String = {icon = "𝓐", hl = "TSString"},
            Number = {icon = "#", hl = "TSNumber"},
            Boolean = {icon = "⊨", hl = "TSBoolean"},
            Array = {icon = "", hl = "TSConstant"},
            Object = {icon = "⦿", hl = "TSType"},
            Key = {icon = "🔐", hl = "TSType"},
            Null = {icon = "NULL", hl = "TSType"},
            EnumMember = {icon = "", hl = "TSField"},
            Struct = {icon = "𝓢", hl = "TSType"},
            Event = {icon = "🗲", hl = "TSType"},
            Operator = {icon = "+", hl = "TSOperator"},
            TypeParameter = {icon = "𝙏", hl = "TSParameter"}
        }
    })
end

function config.nvim_treesitter()
    vim.api.nvim_command("set foldmethod=expr")
    vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

    require"nvim-treesitter.configs".setup {
        ensure_installed = "maintained",
        highlight = {enable = true, disable = {"vim"}},
        rainbow = {
            enable = true,
            extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
            max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
        },
        additional_vim_regex_highlighting = false,
    }
end

function config.nvim_gps()
    require("nvim-gps").setup({
        icons = {
            ["class-name"] = " ", -- Classes and class-like objects
            ["function-name"] = " ", -- Functions
            ["method-name"] = " " -- Methods (functions inside class-like objects)
        },
        languages = {
            -- You can disable any language individually here
            ["c"] = true,
            ["cpp"] = true,
            ["go"] = true,
            ["java"] = true,
            ["javascript"] = true,
            ["lua"] = true,
            ["python"] = true,
            ["rust"] = true
        },
        separator = " > "
    })
end

function config.nvim_colorizer() require("colorizer").setup() end


function config.format()
    require("format").setup {
        ["*"] = {
            {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
        },
        vim = {
            {
                cmd = {"luafmt -w replace"},
                start_pattern = "^lua << EOF$",
                end_pattern = "^EOF$"
            }
        },
        vimwiki = {
            {
                cmd = {"prettier -w --parser babel"},
                start_pattern = "^{{{javascript$",
                end_pattern = "^}}}$"
            }
        },
        lua = {
            {
                cmd = {
                    function(file)
                        return string.format("lua-format -i %s", file)
                    end
                }
            }
        },
        c = {
            {
                cmd = {
                    function(file)
                        return string.format("clang-format -i %s", file)
                    end
                }
            }
        },
        cpp = {
            {
                cmd = {
                    function(file)
                        return string.format("clang-format -i %s", file)
                    end
                }
            }
        },
        go = {{cmd = {"gofmt -w", "goimports -w"}, tempfile_postfix = ".tmp"}},
        python = {
            {cmd = {"python3 -m autopep8 --in-place --aggressive --aggressive"}}
        },
        sh = {
            {
                cmd = {
                    function(file)
                        return string.format("shfmt -w %s", file)
                    end
                }
            }
        },
        rust = {
            {
                cmd = {
                    function(file)
                        return string.format("rustfmt %s", file)
                    end
                }
            }
        },
        html = {{cmd = {"prettier -w"}}},
        javascript = {
            {cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}
        },
        json = {{cmd = {"prettier -w"}}},
        markdown = {
            {cmd = {"prettier -w"}}, {
                cmd = {"black"},
                start_pattern = "^```python$",
                end_pattern = "^```$",
                target = "current"
            }
        }
    }
end

function config.toggleterm()
    require("toggleterm").setup {
        -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.40
            end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        direction = "vertical",
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell -- change the default shell
    }
end

function config.vim_illuminate()
    require("vim-illuminate").setup{}
end

return config
