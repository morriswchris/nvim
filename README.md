# Neovim Configuration

This is your Neovim configuration converted from your Vim setup. It preserves all your keybindings and preferences while using modern Neovim plugins.

## Features

### Preserved from your Vim setup:
- **Dracula colorscheme** with lightline status bar (now lualine)
- **FZF integration** with same keybindings (`<C-f>`, `<leader>o`, `<leader>g`)
- **Rust development** with rust-analyzer LSP
- **All your custom keybindings** and shortcuts
- **File explorer** (NERDTree → nvim-tree)
- **Git integration** (fugitive + gitsigns)
- **Multiple cursors** support
- **Yank stack** functionality
- **Spell checking** with custom highlighting
- **Distraction-free writing** (goyo)

### Modern Neovim improvements:
- **LSP integration** with Mason for automatic language server installation
- **Better completion** with nvim-cmp
- **Treesitter** for superior syntax highlighting
- **Telescope** as an alternative to some FZF functionality
- **Which-key** for discoverable keybindings
- **Auto-pairs** for automatic bracket/parenthesis completion

## Key Mappings (Same as your Vim setup)

### File Operations
- `<leader>w` - Save file
- `<C-f>` - Open file finder (FZF)
- `<leader>o` - Open buffer list
- `<leader>g` - Search in files (Rg)

### Navigation
- `<C-j/k/h/l>` - Move between windows
- `<leader>nn` - Toggle file explorer
- `<leader>nf` - Find current file in explorer
- `<leader>cd` - Change to current file's directory

### Buffer Management
- `<leader>bd` - Close current buffer
- `<leader>ba` - Close all buffers
- `<leader>l/h` - Next/previous buffer

### Tab Management
- `<leader>tn` - New tab
- `<leader>tc` - Close tab
- `<leader>to` - Close other tabs
- `<leader>te` - New tab with current file's directory

### Git Operations
- `<leader>v` - Open current line in browser (GitHub/GitLab)
- Git gutter shows diff markers in the gutter

### Search and Replace
- `<Space>` - Search forward
- `<C-Space>` - Search backward
- `<leader><CR>` - Clear search highlights
- `<leader>g` - Search in files with Rg

### Spell Checking
- `<leader>ss` - Toggle spell checking
- `<leader>sn/sp` - Next/previous spelling error
- `<leader>sa` - Add word to dictionary
- `<leader>s?` - Suggest corrections

### Distraction-free Writing
- `<leader>z` - Toggle Goyo (distraction-free mode)

### Code Execution
- `<F5>` - Run current file (Python, JavaScript, etc.)

### Multiple Cursors
- `<C-s>` - Start multiple cursor selection
- `<A-s>` - Select all instances
- `<C-x>` - Skip current selection
- `<Esc>` - Exit multiple cursor mode

### Yank Stack
- `<C-p>` - Paste older yank
- `<C-n>` - Paste newer yank

## Installation

1. **Install Neovim** (if not already installed):
   ```bash
   brew install neovim
   ```

2. **Install FZF** (if not already installed):
   ```bash
   brew install fzf
   ```

3. **Install ripgrep** (for better search):
   ```bash
   brew install ripgrep
   ```

4. **The configuration is already set up** in `~/.config/nvim/`

## Language Support

### Rust
- Automatic formatting on save
- LSP with rust-analyzer
- Go to definition (`gd`)
- Find references (`gr`)

### Python
- LSP with pyright
- Syntax highlighting
- Auto-completion

### JavaScript/TypeScript
- LSP with tsserver
- Syntax highlighting
- Auto-completion

### Go
- LSP with gopls
- Syntax highlighting
- Auto-completion

## Plugins Used

- **lazy.nvim** - Plugin manager
- **dracula** - Colorscheme
- **lualine** - Status line
- **nvim-tree** - File explorer
- **fzf.vim** - Fuzzy finder
- **vim-fugitive** - Git integration
- **gitsigns** - Git gutter
- **nvim-lspconfig** - LSP configuration
- **mason** - LSP installer
- **nvim-cmp** - Completion
- **vim-visual-multi** - Multiple cursors
- **yanky** - Yank stack
- **nvim-surround** - Surround text
- **Comment.nvim** - Comment toggling
- **indent-blankline** - Indent guides
- **nvim-treesitter** - Syntax highlighting
- **telescope** - Alternative fuzzy finder
- **which-key** - Keybinding help
- **goyo** - Distraction-free writing

## Customization

To add your own settings, create a file at `~/.config/nvim/lua/custom.lua` and add your configurations there. The main configuration is in `~/.config/nvim/init.lua`.

## Differences from Vim

1. **Plugin management**: Uses lazy.nvim instead of pathogen
2. **Configuration**: Uses Lua instead of Vimscript for better performance
3. **LSP**: Native LSP support instead of ALE
4. **Completion**: nvim-cmp instead of built-in completion
5. **Status line**: lualine instead of lightline
6. **File explorer**: nvim-tree instead of NERDTree

All your keybindings and preferences have been preserved!
