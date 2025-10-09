-- Neovim configuration based on your Vim setup
-- This preserves your keybindings and preferences while using modern Neovim plugins

-- Set leader key BEFORE loading lazy.nvim
vim.g.mapleader = ","
-- Note: maplocalleader is set per-buffer, not globally

-- Suppress lspconfig deprecation warning
vim.g.lspconfig_suppress_deprecation_warning = true
-- Alternative method to suppress the warning
vim.env.LSPCONFIG_SUPPRESS_DEPRECATION_WARNING = "1"

-- Set up lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim
require("lazy").setup("plugins")

-- General settings
vim.opt.history = 500
vim.opt.filetype = "plugin"
vim.opt.filetype = "indent"
vim.opt.autoread = true
vim.opt.so = 7 -- Set 7 lines to the cursor when moving vertically
vim.opt.wildmenu = true
vim.opt.wildignore = "*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store"
vim.opt.ruler = true
vim.opt.cmdheight = 1
vim.opt.hidden = true
vim.opt.backspace = "eol,start,indent"
vim.opt.whichwrap = "<,>,h,l"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.magic = true
vim.opt.showmatch = true
vim.opt.mat = 2
vim.opt.errorbells = false
vim.opt.visualbell = false
-- vim.opt.t_vb = "" -- This option doesn't exist in Neovim
vim.opt.tm = 500
vim.opt.foldcolumn = "1"

-- Colors and fonts
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd("colorscheme dracula")

-- Text, tab and indent related
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.lbr = true
vim.opt.tw = 500
vim.opt.ai = true -- Auto indent
vim.opt.si = true -- Smart indent
vim.opt.wrap = true -- Wrap lines

-- Files, backups and undo
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Enable persistent undo
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

-- Status line
vim.opt.laststatus = 2

-- Mouse support
vim.opt.mouse = "a"

-- Line numbers
vim.opt.number = true
vim.opt.cursorline = true

-- Fold settings
vim.opt.foldlevel = 20
vim.opt.foldenable = false

-- Terminal colors (from your config)
vim.g.terminal_ansi_colors = {
  "#373c40", "#ff5454", "#8cc85f", "#e3c78a",
  "#80a0ff", "#ce76e8", "#7ee0ce", "#de935f",
  "#f09479", "#f74782", "#42cf89", "#cfcfb0",
  "#78c2ff", "#ae81ff", "#85dc85", "#e2637f"
}

-- Cursor shape (from your config) - These options don't exist in Neovim
-- vim.opt.t_SI = "\\027]50;CursorShape=1\\x7"
-- vim.opt.t_SR = "\\027]50;CursorShape=2\\x7"
-- vim.opt.t_EI = "\\027]50;CursorShape=0\\x7"

-- Screen/tmux support - These options don't exist in Neovim
-- if string.find(vim.env.TERM or "", "screen") then
--   vim.opt.t_BE = "\\027[?2004h"
--   vim.opt.t_BD = "\\027[?2004l"
--   vim.cmd("set t_PS=\\e[200~")
--   vim.cmd("set t_PE=\\e[201~")
-- end

-- Key mappings (preserving your shortcuts)
-- Fast saving
vim.keymap.set("n", "<leader>w", ":w!<CR>", { silent = true })

-- Search mappings
vim.keymap.set("n", "<Space>", "/")
vim.keymap.set("n", "<C-Space>", "?")
vim.keymap.set("n", "<leader><CR>", ":noh<CR>", { silent = true })

-- Window navigation
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")

-- Buffer management
vim.keymap.set("n", "<leader>bd", ":Bclose<CR>:tabclose<CR>gT")
vim.keymap.set("n", "<leader>ba", ":bufdo bd<CR>")
vim.keymap.set("n", "<leader>l", ":bnext<CR>")
vim.keymap.set("n", "<leader>h", ":bprevious<CR>")

-- Tab management
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>to", ":tabonly<CR>")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tm", ":tabmove")
vim.keymap.set("n", "<leader>t<leader>", ":tabnext<CR>")

-- Tab with current buffer's path
vim.keymap.set("n", "<leader>te", ":tabedit <C-r>=escape(expand(\"%:p:h\"), \" \")<CR>/")

-- Switch CWD to directory of open buffer
vim.keymap.set("n", "<leader>cd", ":cd %:p:h<CR>:pwd<CR>")

-- Quick buffer for scribble
vim.keymap.set("n", "<leader>q", ":e ~/buffer<CR>")
vim.keymap.set("n", "<leader>x", ":e ~/buffer.md<CR>")

-- Toggle paste mode
vim.keymap.set("n", "<leader>pp", ":setlocal paste!<CR>")

-- Spell checking
vim.keymap.set("n", "<leader>ss", ":setlocal spell!<CR>")
vim.keymap.set("n", "<leader>sn", "]s")
vim.keymap.set("n", "<leader>sp", "[s")
vim.keymap.set("n", "<leader>sa", "zg")
vim.keymap.set("n", "<leader>s?", "z=")

-- Remap VIM 0 to first non-blank character
vim.keymap.set("n", "0", "^")

-- Move lines with Alt+j/k
vim.keymap.set("n", "<M-j>", "mz:m+<CR>`z")
vim.keymap.set("n", "<M-k>", "mz:m-2<CR>`z")
vim.keymap.set("v", "<M-j>", ":m'>+<CR>`<my`>mzgv`yo`z")
vim.keymap.set("v", "<M-k>", ":m'<-2<CR>`>my`<mzgv`yo`z")

-- Mac specific mappings
if vim.fn.has("mac") == 1 or vim.fn.has("macunix") == 1 then
  vim.keymap.set("n", "<D-j>", "<M-j>")
  vim.keymap.set("n", "<D-k>", "<M-k>")
  vim.keymap.set("v", "<D-j>", "<M-j>")
  vim.keymap.set("v", "<D-k>", "<M-k>")
end

-- Visual mode mappings
vim.keymap.set("v", "<silent> *", ":<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>")
vim.keymap.set("v", "<silent> #", ":<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>")

-- Parenthesis/bracket mappings
vim.keymap.set("v", "$1", "<esc>`>a)<esc>`<i(<esc>")
vim.keymap.set("v", "$2", "<esc>`>a]<esc>`<i[<esc>")
vim.keymap.set("v", "$3", "<esc>`>a}<esc>`<i{<esc>")
vim.keymap.set("v", "$$", "<esc>`>a\"<esc>`<i\"<esc>")
vim.keymap.set("v", "$q", "<esc>`>a'<esc>`<i'<esc>")
vim.keymap.set("v", "$e", "<esc>`>a`<esc>`<i`<esc>")

-- Insert mode mappings
vim.keymap.set("i", "$1", "()<esc>i")
vim.keymap.set("i", "$2", "[]<esc>i")
vim.keymap.set("i", "$3", "{}<esc>i")
vim.keymap.set("i", "$4", "{<esc>o}<esc>O")
vim.keymap.set("i", "$q", "''<esc>i")
vim.keymap.set("i", "$e", "\"\"<esc>i")

-- Command line mappings
vim.keymap.set("c", "<C-A>", "<Home>")
vim.keymap.set("c", "<C-E>", "<End>")
vim.keymap.set("c", "<C-K>", "<C-U>")
vim.keymap.set("c", "<C-P>", "<Up>")
vim.keymap.set("c", "<C-N>", "<Down>")

-- Map ½ to $
vim.keymap.set("n", "½", "$")
vim.keymap.set("c", "½", "$")
vim.keymap.set("i", "½", "$")

-- FZF mappings (will be configured in plugins)
vim.keymap.set("n", "<C-f>", ":Files<CR>")
vim.keymap.set("n", "<leader>o", ":Buffers<CR>")
vim.keymap.set("n", "<leader>g", ":Rg<CR>")

-- File tree mappings (NERDTree replacement)
vim.keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>nf", ":NvimTreeFind<CR>")

-- Tab/buffer navigation
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>")
vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>")
vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>")
vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>")
vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>")
vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>")
vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>")
vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>")
vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>")
vim.keymap.set("n", "<leader>0", ":BufferLineGoToBuffer -1<CR>")

-- Buffer management
vim.keymap.set("n", "<leader>d", ":bufdo bd!<CR>")
vim.keymap.set("n", "<C-W>`", "gg=G<C-o><C-o>")

-- Rust specific settings
vim.g.rustfmt_autosave = 1

-- Spell highlighting (from your config)
vim.cmd("highlight clear SpellBad")
vim.cmd("highlight clear SpellLocal")
vim.cmd("highlight clear SpellRare")
vim.cmd("highlight clear SpellCap")
vim.cmd("hi SpellBad cterm=underline gui=Undercurl ctermbg=103 guibg=#8787af")
vim.cmd("hi SpellLocal cterm=underline gui=Undercurl ctermbg=103 guibg=#8787af")
vim.cmd("hi SpellRare cterm=underline gui=Undercurl ctermbg=103 guibg=#8787af")
vim.cmd("hi SpellCap cterm=underline gui=Undercurl ctermbg=103 guibg=#8787af")

-- Vue syntax sync
vim.cmd("autocmd FileType vue syntax sync fromstart")

-- Filetype specific settings
vim.cmd("autocmd FileType python syn keyword pythonDecorator True None False self")
vim.cmd("autocmd BufNewFile,BufRead *.jinja set syntax=htmljinja")
vim.cmd("autocmd BufNewFile,BufRead *.mako set ft=mako")
vim.cmd("autocmd FileType python map <buffer> F :set foldmethod=indent<cr>")

-- Python abbreviations
vim.cmd("autocmd FileType python inoremap <buffer> $r return ")
vim.cmd("autocmd FileType python inoremap <buffer> $i import ")
vim.cmd("autocmd FileType python inoremap <buffer> $p print ")
vim.cmd("autocmd FileType python inoremap <buffer> $f # --- <esc>a")
vim.cmd("autocmd FileType python map <buffer> <leader>1 /class ")
vim.cmd("autocmd FileType python map <buffer> <leader>2 /def ")
vim.cmd("autocmd FileType python map <buffer> <leader>C ?class ")
vim.cmd("autocmd FileType python map <buffer> <leader>D ?def ")

-- JavaScript/TypeScript settings
vim.cmd("autocmd FileType javascript call JavaScriptFold()")
vim.cmd("autocmd FileType javascript setl fen")
vim.cmd("autocmd FileType javascript setl nocindent")
vim.cmd("autocmd FileType javascript,typescript imap <C-t> console.log();<esc>hi")
vim.cmd("autocmd FileType javascript,typescript imap <C-a> alert();<esc>hi")
vim.cmd("autocmd FileType javascript,typescript inoremap <buffer> $r return ")
vim.cmd("autocmd FileType javascript,typescript inoremap <buffer> $f // --- PH<esc>FP2xi")

-- YAML settings
vim.cmd("autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab")

-- Markdown settings
vim.g.vim_markdown_folding_disabled = 1

-- Twig settings
vim.cmd("autocmd BufRead *.twig set syntax=html filetype=html")

-- Return to last edit position when opening files
vim.cmd("autocmd BufReadPost * if line(\"'\\\"\") > 1 && line(\"'\\\"\") <= line(\"$\") | exe \"normal! g'\\\"\" | endif")

-- Clean extra spaces on save
function CleanExtraSpaces()
    local save_cursor = vim.fn.getpos(".")
    local old_query = vim.fn.getreg("/")
    vim.cmd("silent! %s/\\s\\+$//e")
    vim.fn.setpos(".", save_cursor)
    vim.fn.setreg("/", old_query)
end

vim.cmd("autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee lua CleanExtraSpaces()")

-- Helper functions
function HasPaste()
    if vim.o.paste then
        return "PASTE MODE  "
    end
    return ""
end

-- Bclose function
function Bclose()
    local currentBufNum = vim.fn.bufnr("%")
    local alternateBufNum = vim.fn.bufnr("#")

    if vim.fn.buflisted(alternateBufNum) == 1 then
        vim.cmd("buffer #")
    else
        vim.cmd("bnext")
    end

    if vim.fn.bufnr("%") == currentBufNum then
        vim.cmd("new")
    end

    if vim.fn.buflisted(currentBufNum) == 1 then
        vim.cmd("bdelete! " .. currentBufNum)
    end
end

vim.cmd("command! Bclose lua Bclose()")

-- Visual selection function
function VisualSelection(direction, extra_filter)
    local saved_reg = vim.fn.getreg("@")
    vim.cmd("normal! vgvy")

    local pattern = vim.fn.escape(vim.fn.getreg("@"), "\\/.*'$^~[]")
    pattern = vim.fn.substitute(pattern, "\n$", "", "")

    if direction == "gv" then
        vim.cmd("Ack '" .. pattern .. "' ")
    elseif direction == "replace" then
        vim.cmd("%s" .. "/" .. pattern .. "/")
    end

    vim.fn.setreg("/", pattern)
    vim.fn.setreg("@", saved_reg)
end

-- Compile and run function (F5)
function CompileRun()
    vim.cmd("w")
    local filetype = vim.bo.filetype
    
    if filetype == "c" then
        vim.cmd("!gcc % -o %<")
        vim.cmd("!time ./%<")
    elseif filetype == "cpp" then
        vim.cmd("!g++ % -o %<")
        vim.cmd("!time ./%<")
    elseif filetype == "java" then
        vim.cmd("!javac %")
        vim.cmd("!time java %")
    elseif filetype == "sh" then
        vim.cmd("!time bash %")
    elseif filetype == "python" then
        vim.cmd("!time python3 %")
    elseif filetype == "html" then
        vim.cmd("!google-chrome % &")
    elseif filetype == "go" then
        vim.cmd("!go build %<")
        vim.cmd("!time go run %")
    elseif filetype == "matlab" then
        vim.cmd("!time octave %")
    end
end

vim.keymap.set("n", "<F5>", ":lua CompileRun()<CR>")
vim.keymap.set("i", "<F5>", "<Esc>:lua CompileRun()<CR>")
vim.keymap.set("v", "<F5>", "<Esc>:lua CompileRun()<CR>")

-- JavaScript fold function
function JavaScriptFold()
    vim.opt_local.foldmethod = "syntax"
    vim.opt_local.foldlevelstart = 1
    vim.cmd("syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend")
    
    function FoldText()
        return vim.fn.substitute(vim.fn.getline(vim.v.foldstart), "{.*", "{...}", "")
    end
    vim.opt_local.foldtext = "FoldText()"
end

-- CoffeeScript fold function
function CoffeeScriptFold()
    vim.opt_local.foldmethod = "indent"
    vim.opt_local.foldlevelstart = 1
end

vim.cmd("autocmd FileType coffee lua CoffeeScriptFold()")

-- Git commit cursor position
vim.cmd("autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])")

-- Tmux support
if vim.env.TMUX then
    vim.opt.termguicolors = true
end

-- FZF default options
vim.env.FZF_DEFAULT_OPTS = "--bind ctrl-a:select-all"

-- FZF colors
vim.g.fzf_colors = {
    fg = {"fg", "Normal"},
    bg = {"bg", "Normal"},
    hl = {"fg", "Comment"},
    ["fg+"] = {"fg", "CursorLine", "CursorColumn", "Normal"},
    ["bg+"] = {"bg", "CursorLine", "CursorColumn"},
    ["hl+"] = {"fg", "Statement"},
    info = {"fg", "PreProc"},
    border = {"fg", "Ignore"},
    prompt = {"fg", "Conditional"},
    pointer = {"fg", "Exception"},
    marker = {"fg", "Keyword"},
    spinner = {"fg", "Label"},
    header = {"fg", "Comment"}
}

vim.g.fzf_preview_window = {}

-- Vimwiki configuration
function SetVimScriptConfig(index, path)
    return {syntax = "markdown", ext = ".md", path = path}
end

local vim_wiki_default_config = {syntax = "markdown", ext = ".md"}
local vim_wiki_config = {vim_wiki_default_config}

if vim.env.VIM_WIKI_PATHS ~= "" then
    vim_wiki_config = {}
    local vim_wiki_paths = vim.split(vim.env.VIM_WIKI_PATHS, ",")
    vim_wiki_config = vim.tbl_map(function(path)
        return SetVimScriptConfig(0, path)
    end, vim_wiki_paths)
end

vim.g.vimwiki_list = vim_wiki_config

-- Disable copilot by default (as in your config)
vim.g.copilot_enabled = false

-- Rust cursor position preservation
vim.g.rust_cursor_position = {}

vim.cmd("autocmd BufWritePre *.rs let g:rust_cursor_position = {'line': line('.'), 'col': col('.')}")
vim.cmd("autocmd User ALEFixPost if &filetype ==# 'rust' | call cursor(g:rust_cursor_position.line, g:rust_cursor_position.col) | endif")
