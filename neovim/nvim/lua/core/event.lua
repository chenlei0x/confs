local vim = vim
local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.api.nvim_command("augroup " .. group_name)
        vim.api.nvim_command("autocmd!")
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten {"autocmd", def}, " ")
            vim.api.nvim_command(command)
        end
        vim.api.nvim_command("augroup END")
    end
end

function autocmd.load_autocmds()
    local definitions = {
        packer = {},
        bufs = {
            -- Reload vim config automatically
            {
                "BufWritePost",
                [[$VIM_PATH/{*.vim,*.yaml,vimrc} nested source $MYVIMRC | redraw]]
            },
            -- Reload Vim script automatically if setlocal autoread
            {
                "BufWritePost,FileWritePost", "*.vim",
                [[nested if &l:autoread > 0 | source <afile> | echo 'source ' . bufname('%') | endif]]
            }, 
            {"BufWritePre", "/tmp/*", "setlocal noundofile"},
            {"BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile"},
            {"BufWritePre", "MERGE_MSG", "setlocal noundofile"},
            {"BufWritePre", "*.tmp", "setlocal noundofile"},
            {"BufWritePre", "*.bak", "setlocal noundofile"},
            {
                "BufReadPost", "*",
                [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif]]
            }
        },
        wins = {
            -- Force write shada on leaving nvim
            {
                "VimLeave", "*",
                [[if has('nvim') | wshada! | else | wviminfo! | endif]]
            },
            -- Check if file changed when its window is focus, more eager than 'autoread'
            {"FocusGained", "* checktime"},
            -- Equalize window dimensions when resizing vim window
            {"VimResized", "*", [[tabdo wincmd =]]}
        },
        ft = {
            {"BufNewFile,BufRead", "*.toml", " setf toml"},
            {"FileType", "make", "set noexpandtab shiftwidth=8 softtabstop=0"},
            {"FileType", "go,rust", "setlocal tabstop=4 shiftwidth=4"},
            {"FileType", "c,cpp", "setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=0"},
            {
                "FileType", "javascript,typescript,html",
                "setlocal tabstop=2 shiftwidth=2"
            },
            {
                "FileType", "dashboard",
                "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"
            },
            {
                "FileType", "*",
                [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
            },
            {
                "FileType", "c,cpp",
                "nnoremap <leader>h :ClangdSwitchSourceHeaderVSplit<CR>"
            },
            {"FileType", "help", "nnoremap <buffer> q :q<CR>"},
        },
        yank = {
            {
                "TextYankPost", "*",
                [[silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=300})]]
            }
        },
        shebang = {
            {
                "BufNewFile" ,"*.py",
                [[:execute "normal! i#!/usr/bin/env python3\<cr>#-*- coding: utf-8 -*-\<cr>\<cr>"]]
            },
            {
                "BufNewFile", "*.sh", 
                [[:execute "normal! i#!/bin/bash\<cr>"]]
            },
        }
    }

    autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()
