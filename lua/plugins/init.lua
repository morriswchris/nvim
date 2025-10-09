-- Plugin configuration for Neovim
-- This replaces your Vim plugins with modern Neovim equivalents

return {
  -- Plugin manager
  {
    "folke/lazy.nvim",
    version = "*",
    lazy = false,
  },

  -- Colorscheme
  {
    "dracula/vim",
    name = "dracula",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme dracula")
    end,
  },

  -- Status line (replaces lightline)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "dracula",
          component_separators = { left = " ", right = " " },
          section_separators = { left = " ", right = " " },
        },
        sections = {
          lualine_a = { "mode", "paste" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        },
        extensions = { "fugitive" }
      })
    end,
  },

  -- Tab bar styling with contrasting colors
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          themable = true,
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          indicator = {
            icon = "▎",
            style = "icon",
          },
          buffer_close_icon = "󰅖",
          modified_icon = "●",
          left_trunc_marker = "󰍉",
          right_trunc_marker = "󰍉",
          max_name_length = 18,
          max_prefix_length = 15,
          tab_size = 18,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            },
          },
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          show_duplicate_prefix = true,
          persist_buffer_sort = true,
          move_wraps_at_ends = false,
          groups = {
            options = {
              toggle_hidden_on_enter = true,
            },
            items = {
              {
                name = "Tests",
                highlight = { underline = true, sp = "blue" },
                priority = 2,
              },
              {
                name = "docs",
                highlight = { underline = true, sp = "green" },
                priority = 3,
              },
            },
          },
          sort_by = "insert_after_current",
        },
        highlights = {
          fill = {
            bg = "#44475a", -- Dracula purple-gray for tab bar background
          },
          background = {
            bg = "#44475a", -- Tab background
          },
          tab = {
            bg = "#44475a", -- Individual tab background
          },
          tab_selected = {
            bg = "#6272a4", -- Selected tab background (Dracula purple)
            fg = "#f8f8f2", -- Selected tab text
          },
          tab_close = {
            bg = "#44475a", -- Close button background
            fg = "#bd93f9", -- Brighter purple for close button
          },
          close_button = {
            bg = "#44475a",
            fg = "#bd93f9",
          },
          close_button_visible = {
            bg = "#44475a",
            fg = "#bd93f9",
          },
          close_button_selected = {
            bg = "#6272a4",
            fg = "#ff5555",
          },
          buffer_selected = {
            bg = "#6272a4",
            fg = "#f8f8f2",
            bold = true,
          },
          buffer_visible = {
            bg = "#44475a",
            fg = "#bd93f9", -- Brighter purple for better visibility
          },
          numbers = {
            bg = "#44475a",
            fg = "#bd93f9", -- Brighter purple for tab numbers
          },
          numbers_visible = {
            bg = "#44475a",
            fg = "#bd93f9",
          },
          numbers_selected = {
            bg = "#6272a4",
            fg = "#f8f8f2",
            bold = true,
          },
          diagnostic = {
            bg = "#44475a",
            fg = "#bd93f9", -- Brighter purple for diagnostics
          },
          diagnostic_visible = {
            bg = "#44475a",
            fg = "#bd93f9",
          },
          diagnostic_selected = {
            bg = "#6272a4",
            fg = "#f8f8f2",
            bold = true,
          },
          hint = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          hint_visible = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          hint_selected = {
            bg = "#282a36",
            fg = "#50fa7b",
            bold = true,
          },
          hint_diagnostic = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          hint_diagnostic_visible = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          hint_diagnostic_selected = {
            bg = "#282a36",
            fg = "#50fa7b",
            bold = true,
          },
          info = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          info_visible = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          info_selected = {
            bg = "#282a36",
            fg = "#8be9fd",
            bold = true,
          },
          info_diagnostic = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          info_diagnostic_visible = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          info_diagnostic_selected = {
            bg = "#282a36",
            fg = "#8be9fd",
            bold = true,
          },
          warning = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          warning_visible = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          warning_selected = {
            bg = "#282a36",
            fg = "#ffb86c",
            bold = true,
          },
          warning_diagnostic = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          warning_diagnostic_visible = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          warning_diagnostic_selected = {
            bg = "#282a36",
            fg = "#ffb86c",
            bold = true,
          },
          error = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          error_visible = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          error_selected = {
            bg = "#282a36",
            fg = "#ff5555",
            bold = true,
          },
          error_diagnostic = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          error_diagnostic_visible = {
            bg = "#1e1e2e",
            fg = "#6272a4",
          },
          error_diagnostic_selected = {
            bg = "#282a36",
            fg = "#ff5555",
            bold = true,
          },
          modified = {
            bg = "#44475a",
            fg = "#ffb86c",
          },
          modified_visible = {
            bg = "#44475a",
            fg = "#ffb86c",
          },
          modified_selected = {
            bg = "#6272a4",
            fg = "#ffb86c",
          },
          duplicate_selected = {
            bg = "#6272a4",
            fg = "#bd93f9", -- Brighter purple for duplicates
            italic = true,
          },
          duplicate_visible = {
            bg = "#44475a",
            fg = "#bd93f9",
            italic = true,
          },
          duplicate = {
            bg = "#44475a",
            fg = "#bd93f9",
            italic = true,
          },
          separator_selected = {
            bg = "#6272a4",
            fg = "#44475a",
          },
          separator_visible = {
            bg = "#44475a",
            fg = "#44475a",
          },
          separator = {
            bg = "#44475a",
            fg = "#44475a",
          },
          indicator_selected = {
            bg = "#282a36",
            fg = "#50fa7b",
          },
          pick_selected = {
            bg = "#282a36",
            fg = "#ff79c6",
            bold = true,
            italic = true,
          },
          pick_visible = {
            bg = "#1e1e2e",
            fg = "#ff79c6",
            bold = true,
            italic = true,
          },
          pick = {
            bg = "#1e1e2e",
            fg = "#ff79c6",
            bold = true,
            italic = true,
          },
        },
      })
    end,
  },

  -- File explorer (replaces NERDTree) - No icons, clean text-only view
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        view = {
          side = "right",
          width = 35,
        },
        renderer = {
          icons = {
            show = {
              file = false,
              folder = false,
              folder_arrow = true,
              git = false,
            },
            glyphs = {
              folder = {
                arrow_closed = "▶",
                arrow_open = "▼",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = { "^\\.pyc$", "__pycache__" },
        },
        git = {
          enable = true,
          ignore = false,
        },
      })
      
      -- NERDTree replacement mappings
      vim.keymap.set("n", "<leader>nn", ":NvimTreeToggle<CR>")
      vim.keymap.set("n", "<leader>nf", ":NvimTreeFind<CR>")
    end,
  },

  -- Fuzzy finder (FZF integration)
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      -- FZF configuration
      vim.g.fzf_command_prefix = "Fzf"
      vim.g.fzf_layout = { down = "~40%" }
      
      -- Key mappings (preserving your shortcuts)
      vim.keymap.set("n", "<C-f>", ":Files<CR>")
      vim.keymap.set("n", "<leader>o", ":Buffers<CR>")
      vim.keymap.set("n", "<leader>g", ":Rg<CR>")
    end,
  },

  -- Git integration (fugitive)
  {
    "tpope/vim-fugitive",
    config = function()
      -- Git mappings
      vim.keymap.set("n", "<leader>v", ":GBrowse!<CR>")
      vim.keymap.set("v", "<leader>v", ":GBrowse!<CR>")
    end,
  },

  -- Git gutter (shows git diff)
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = false,
        },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          
          -- Navigation
          vim.keymap.set("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true, buffer = bufnr })

          vim.keymap.set("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true, buffer = bufnr })

          -- Actions
          vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr })
          vim.keymap.set("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { buffer = bufnr })
          vim.keymap.set("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { buffer = bufnr })
          vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hd", gs.diffthis, { buffer = bufnr })
          vim.keymap.set("n", "<leader>hD", function() gs.diffthis("~") end, { buffer = bufnr })
          vim.keymap.set("n", "<leader>td", gs.toggle_deleted, { buffer = bufnr })

          -- Text object
          vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { buffer = bufnr })
        end
      })
    end,
  },

  -- LSP and completion (replaces ALE)
  {
    "neovim/nvim-lspconfig",
    version = "0.1.*", -- Use stable version to avoid deprecation warnings
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      -- Suppress lspconfig deprecation warning
      vim.g.lspconfig_suppress_deprecation_warning = true
      
      -- Mason setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "rust_analyzer", "ts_ls", "gopls" }
        -- Note: pyright is installed system-wide via npm
      })

      -- LSP setup
      -- Note: The deprecation warning about lspconfig is expected and harmless.
      -- The new vim.lsp.config API is not fully stable yet in Neovim 0.11.4
      local lspconfig = require("lspconfig")
      
      -- Rust
      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            procMacro = { enable = true },
            checkOnSave = { allFeatures = true },
            completion = { enable = true },
          }
        }
      })

      -- Python
      lspconfig.pyright.setup({
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = lspconfig.util.root_pattern("pyproject.toml", "setup.py", "requirements.txt", ".git"),
      })

      -- TypeScript/JavaScript
      lspconfig.ts_ls.setup({})

      -- Go
      lspconfig.gopls.setup({})

      -- Global mappings
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
      vim.keymap.set("n", "<leader>as", ":copen<CR>", { desc = "Open quickfix" })
      vim.keymap.set("n", "<leader>aa", ":cclose<CR>", { desc = "Close quickfix" })

      -- CMP setup
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Set up capabilities
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- Capabilities are now handled by vim.lsp.config automatically
    end,
  },

  -- Rust formatting
  {
    "rust-lang/rust.vim",
    config = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- Multiple cursors (replaces vim-multiple-cursors)
  {
    "mg979/vim-visual-multi",
    config = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-s>",
        ["Find Subword Under"] = "<C-s>",
        ["Select All"] = "<A-s>",
        ["Start Regex Search"] = "g<C-s>",
        ["Select All"] = "g<A-s>",
        ["Skip Region"] = "<C-x>",
        ["Remove Region"] = "<C-w>",
        ["Exit"] = "<Esc>",
      }
    end,
  },

  -- Yank stack (replaces vim-yankstack)
  {
    "gbprod/yanky.nvim",
    config = function()
      require("yanky").setup()
      vim.keymap.set("n", "<C-p>", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<C-n>", "<Plug>(YankyCycleBackward)")
    end,
  },

  -- Surround (replaces vim-surround)
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- Commentary (replaces vim-commentary)
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Indent guides (version 3)
  {
    "lukas-reineke/indent-blankline.nvim",
    version = "3.0",
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = true,
        },
      })
    end,
  },

  -- EditorConfig
  {
    "editorconfig/editorconfig-vim",
  },

  -- Vimwiki
  {
    "vimwiki/vimwiki",
    config = function()
      vim.g.vimwiki_list = {
        {
          syntax = "markdown",
          ext = ".md",
          path = "~/vimwiki/",
        }
      }
    end,
  },

  -- Distraction free writing (replaces goyo.vim)
  {
    "junegunn/goyo.vim",
    config = function()
      vim.g.goyo_width = 100
      vim.g.goyo_margin_top = 2
      vim.g.goyo_margin_bottom = 2
      vim.keymap.set("n", "<leader>z", ":Goyo<CR>")
    end,
  },

  -- Buffer management
  {
    "kazhala/close-buffers.nvim",
    config = function()
      require("close_buffers").setup({
        filetype_ignore = {},
        file_ignore = {},
        type_ignore = {},
        next_buffer_cmd = nil,
      })
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },

  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "rust", "python", "javascript", "typescript", "go", "lua", "vim", "vimdoc", "markdown", "yaml", "json" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },

  -- Telescope (modern alternative to some FZF functionality)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-a>"] = "select_all",
            },
          },
        },
      })
      
      -- Additional telescope mappings
      vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
      vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
      vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
      vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
    end,
  },

  -- Which key (shows available keybindings) - Manual only
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        -- Disable all automatic triggers
        triggers = {},
        -- Don't show help automatically
        show_help = false,
        -- Don't register automatically
        register = {},
        -- Disable timeout
        timeout = false,
        -- Disable delay
        delay = 0,
      })
      
      -- Manual commands to show help
      vim.keymap.set("n", "<leader>k", ":WhichKey<CR>", { desc = "Show keybindings help" })
      vim.keymap.set("n", "<leader>?", ":WhichKey<CR>", { desc = "Show keybindings help" })
    end,
  },
}
