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

  -- LSP and completion (replaces ALE) using vim.lsp.config (Neovim 0.11+)
  {
    "neovim/nvim-lspconfig",
    version = false, -- use latest; config lives under vim.lsp.config in Neovim
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
      if vim.lsp.config == nil then
        vim.notify("vim.lsp.config not available. Update Neovim to >= 0.11.x.", vim.log.levels.ERROR)
        return
      end

      -- Mason setup
      require("mason").setup()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = { "rust_analyzer", "pyright", "ts_ls", "gopls" },
      })

      -- Capabilities for nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Common on_attach for buffer-local keymaps
      local on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gr", vim.lsp.buf.references, "Go to references")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
        map("n", "<leader>as", ":copen<CR>", "Open quickfix")
        map("n", "<leader>aa", ":cclose<CR>", "Close quickfix")

        -- Ensure diagnostics are enabled for this buffer
        vim.diagnostic.enable(bufnr)
        
        -- In Neovim 0.11+, diagnostics should work automatically via vim.diagnostic
        -- The LSP client will automatically publish diagnostics to vim.diagnostic

        -- Inlay hints if supported
        if vim.lsp.inlay_hint and vim.lsp.inlay_hint.enable ~= nil then
          local clients = vim.lsp.get_clients({ bufnr = bufnr })
          for _, c in ipairs(clients) do
            if c.server_capabilities and c.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
              break
            end
          end
        end
      end

      -- Diagnostics configuration
      vim.diagnostic.config({
        underline = true,
        virtual_text = { 
          enabled = true,
          spacing = 2, 
          prefix = "●",
          severity = {
            min = vim.diagnostic.severity.HINT,
          },
        },
        signs = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })
      
      -- Ensure diagnostics are enabled globally
      vim.diagnostic.enable()
      
      -- Set up diagnostic signs
      local signs = {
        { name = "DiagnosticSignError", text = "E", texthl = "DiagnosticSignError" },
        { name = "DiagnosticSignWarn", text = "W", texthl = "DiagnosticSignWarn" },
        { name = "DiagnosticSignInfo", text = "I", texthl = "DiagnosticSignInfo" },
        { name = "DiagnosticSignHint", text = "H", texthl = "DiagnosticSignHint" },
      }
      
      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end

      -- Server configurations using new API
      vim.lsp.config.rust_analyzer = {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "rust" },
        root_dir = function(bufnr)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          if fname == "" then return nil end
          local found = vim.fs.find({ "Cargo.toml", ".git" }, { path = fname, upward = true })
          if #found > 0 then
            return vim.fs.dirname(found[1])
          end
          -- Fallback: use the file's directory as root
          return vim.fs.dirname(fname)
        end,
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            procMacro = { enable = true },
            checkOnSave = { 
              command = "clippy",
              allFeatures = true,
            },
            completion = { enable = true },
            diagnostics = {
              enable = true,
            },
            inlayHints = {
              enable = true,
            },
          },
        },
      }

      vim.lsp.config.pyright = {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "python" },
        root_dir = function(bufnr)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          if fname == "" then return nil end
          local found = vim.fs.find({ "pyproject.toml", "setup.py", "requirements.txt", ".git" }, { path = fname, upward = true })
          if #found > 0 then
            return vim.fs.dirname(found[1])
          end
          -- Fallback: use the file's directory as root
          return vim.fs.dirname(fname)
        end,
        settings = {
          python = {
            analysis = { typeCheckingMode = "basic", autoImportCompletions = true },
          },
        },
      }

      vim.lsp.config.tsserver = {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        root_dir = function(bufnr)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          if fname == "" then return nil end
          local found = vim.fs.find({ "package.json", "tsconfig.json", "jsconfig.json", ".git" }, { path = fname, upward = true })
          if #found > 0 then
            return vim.fs.dirname(found[1])
          end
          -- Fallback: use the file's directory as root
          return vim.fs.dirname(fname)
        end,
      }

      vim.lsp.config.gopls = {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = function(bufnr)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          if fname == "" then return nil end
          local found = vim.fs.find({ "go.work", "go.mod", ".git" }, { path = fname, upward = true })
          if #found > 0 then
            return vim.fs.dirname(found[1])
          end
          -- Fallback: use the file's directory as root
          return vim.fs.dirname(fname)
        end,
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
          },
        },
      }

      -- Mapping between vim.lsp.config names and mason-lspconfig server names
      local server_name_map = {
        tsserver = "ts_ls",
      }

      -- Auto-start LSP clients for relevant buffers
      local function maybe_start_lsp(bufnr)
        -- Skip special buffers
        if vim.bo[bufnr].buftype ~= "" then return end

        local ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
        if ft == "" then
          -- Filetype not set yet, skip
          return
        end
        
        for name, cfg in pairs(vim.lsp.config) do
          -- Skip meta-keys (keys starting with underscore)
          if name:match("^_") then
            -- Skip this iteration
          elseif type(cfg) ~= "table" then
            -- Skip invalid configs
          else
            local fts = cfg.filetypes
            if fts == nil or (ft ~= "" and vim.tbl_contains(fts, ft)) then
              local clients = vim.lsp.get_clients({ bufnr = bufnr, name = name })
              if #clients == 0 then
              -- Build start config from cfg, excluding any internal/meta keys
              -- Always set cmd explicitly - don't copy from cfg
              local start_cfg = {
                capabilities = cfg.capabilities,
                on_attach = cfg.on_attach,
                filetypes = cfg.filetypes,
                root_dir = cfg.root_dir,
                settings = cfg.settings,
              }
              
              -- Always determine cmd explicitly - don't trust cfg.cmd
              do
                -- Map the server name to mason-lspconfig name if needed
                local mason_name = server_name_map[name] or name
                local cmd_found = false
                
                -- Determine the actual executable name to search for
                local exe_name
                if mason_name == "rust_analyzer" then
                  exe_name = "rust-analyzer"
                elseif mason_name == "ts_ls" then
                  exe_name = "typescript-language-server"
                elseif mason_name == "pyright" then
                  exe_name = "pyright-langserver"
                elseif mason_name == "gopls" then
                  exe_name = "gopls"
                else
                  exe_name = mason_name
                end
                
                -- Try to get executable from mason-registry first
                local ok_registry, registry = pcall(require, "mason-registry")
                if ok_registry and registry then
                  local ok_pkg, pkg = pcall(function() return registry.get_package(mason_name) end)
                  if ok_pkg and pkg and pkg:is_installed() then
                    -- Try mason's bin directory directly
                    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/" .. exe_name
                    if vim.fn.executable(mason_bin) == 1 then
                      local cmd = { mason_bin }
                      -- Add common args for stdio servers
                      if mason_name == "pyright" then
                        table.insert(cmd, "--stdio")
                      elseif mason_name == "ts_ls" then
                        table.insert(cmd, "--stdio")
                      end
                      -- Validate cmd before setting
                      if cmd[1] and type(cmd[1]) == "string" and not cmd[1]:match("^_") then
                        start_cfg.cmd = cmd
                        cmd_found = true
                      end
                    else
                      -- Try using get_install_path
                      local install_path = pkg:get_install_path()
                      if install_path then
                        local bin_dir = install_path .. "/bin"
                        local mason_exe = bin_dir .. "/" .. exe_name
                        if vim.fn.executable(mason_exe) == 1 then
                          local cmd = { mason_exe }
                          -- Add common args for stdio servers
                          if mason_name == "pyright" then
                            table.insert(cmd, "--stdio")
                          elseif mason_name == "ts_ls" then
                            table.insert(cmd, "--stdio")
                          end
                          -- Validate cmd before setting
                          if cmd[1] and type(cmd[1]) == "string" and not cmd[1]:match("^_") then
                            start_cfg.cmd = cmd
                            cmd_found = true
                          end
                        end
                      end
                    end
                  end
                end
                
                -- Fallback: try to find executable in PATH
                if not cmd_found then
                  local exe = vim.fn.exepath(exe_name)
                  if exe and exe ~= "" then
                    local cmd = { exe }
                    -- Add common args for stdio servers
                    if mason_name == "pyright" then
                      table.insert(cmd, "--stdio")
                    elseif mason_name == "ts_ls" then
                      table.insert(cmd, "--stdio")
                    end
                    -- Validate cmd before setting
                    if cmd[1] and type(cmd[1]) == "string" and not cmd[1]:match("^_") then
                      start_cfg.cmd = cmd
                      cmd_found = true
                    end
                  end
                end
                
                -- Last resort: use executable name (will try to find in PATH at runtime)
                if not cmd_found then
                  local cmd = { exe_name }
                  -- Add common args for stdio servers
                  if mason_name == "pyright" then
                    table.insert(cmd, "--stdio")
                  elseif mason_name == "ts_ls" then
                    table.insert(cmd, "--stdio")
                  end
                  -- Validate cmd before setting
                  if cmd[1] and type(cmd[1]) == "string" and not cmd[1]:match("^_") then
                    start_cfg.cmd = cmd
                  end
                end
              end
              
              -- Final validation: ensure cmd is always a valid table
              if not start_cfg.cmd or type(start_cfg.cmd) ~= "table" or #start_cfg.cmd == 0 or not start_cfg.cmd[1] or type(start_cfg.cmd[1]) ~= "string" or start_cfg.cmd[1]:match("^_") then
                -- Force a valid cmd - use executable name that should be in PATH
                local exe_name
                if name == "rust_analyzer" then
                  exe_name = "rust-analyzer"
                elseif name == "tsserver" then
                  exe_name = "typescript-language-server"
                elseif name == "pyright" then
                  exe_name = "pyright-langserver"
                elseif name == "gopls" then
                  exe_name = "gopls"
                else
                  exe_name = name
                end
                
                start_cfg.cmd = { exe_name }
                -- Add stdio flags if needed
                if name == "pyright" or name == "tsserver" then
                  table.insert(start_cfg.cmd, "--stdio")
                end
              end
              
              -- Double-check cmd is valid before starting
              if not start_cfg.cmd or type(start_cfg.cmd) ~= "table" or #start_cfg.cmd == 0 or type(start_cfg.cmd[1]) ~= "string" then
                vim.notify("LSP cmd validation failed for " .. name .. ": cmd=" .. vim.inspect(start_cfg.cmd), vim.log.levels.ERROR)
                -- Force cmd to be valid
                local exe_name = name == "rust_analyzer" and "rust-analyzer" or name
                start_cfg.cmd = { exe_name }
              end
              
              -- Build final config explicitly - validate cmd one more time
              local final_cmd = start_cfg.cmd
              if not final_cmd or type(final_cmd) ~= "table" or #final_cmd == 0 or not final_cmd[1] or type(final_cmd[1]) ~= "string" or final_cmd[1]:match("^_") then
                -- Last resort: use executable name
                local exe_name = name == "rust_analyzer" and "rust-analyzer" or 
                                (name == "tsserver" and "typescript-language-server" or
                                (name == "pyright" and "pyright-langserver" or name))
                final_cmd = { exe_name }
                if name == "pyright" or name == "tsserver" then
                  table.insert(final_cmd, "--stdio")
                end
              end
              
              local final_cfg = {
                name = name,
                cmd = final_cmd,
                capabilities = start_cfg.capabilities,
                on_attach = start_cfg.on_attach,
                filetypes = start_cfg.filetypes,
                root_dir = start_cfg.root_dir,
                settings = start_cfg.settings,
              }
              
              -- Start the client
              local ok, client_id = pcall(function()
                -- Start the client and attach it to the buffer
                return vim.lsp.start(final_cfg, { bufnr = bufnr })
              end)
              
              if not ok then
                vim.notify("Failed to start LSP client " .. name .. ": " .. tostring(client_id), vim.log.levels.ERROR)
              elseif client_id then
                -- Client started successfully
                -- In Neovim 0.11, the client should automatically attach to the buffer
                -- But let's verify it's attached
                vim.schedule(function()
                  local clients = vim.lsp.get_clients({ bufnr = bufnr, name = name })
                  if #clients == 0 then
                    vim.notify("LSP client " .. name .. " started but not attached to buffer", vim.log.levels.WARN)
                  end
                end)
              end
              end
            end
          end
        end
      end

      vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "FileType" }, {
        callback = function(args)
          maybe_start_lsp(args.buf)
        end,
      })
      
      -- Add a command to check diagnostics
      vim.api.nvim_create_user_command("CheckDiagnostics", function()
        local bufnr = vim.api.nvim_get_current_buf()
        local diagnostics = vim.diagnostic.get(bufnr)
        if #diagnostics == 0 then
          vim.notify("No diagnostics found for this buffer", vim.log.levels.INFO)
        else
          vim.notify("Found " .. #diagnostics .. " diagnostics", vim.log.levels.INFO)
          for _, diag in ipairs(diagnostics) do
            print(string.format("[%s] %s (line %d)", diag.severity, diag.message, diag.lnum + 1))
          end
        end
        
        -- Also check LSP clients
        local clients = vim.lsp.get_clients({ bufnr = bufnr })
        if #clients == 0 then
          vim.notify("No LSP clients attached to this buffer", vim.log.levels.WARN)
        else
          print("\nLSP clients attached:")
          for _, client in ipairs(clients) do
            print("  - " .. client.name)
            if client.server_capabilities then
              print("    Diagnostic provider: " .. tostring(client.server_capabilities.diagnosticProvider ~= nil))
            end
          end
        end
        
        -- Debug: Check filetype and config
        local ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
        print("\nFiletype: " .. (ft ~= "" and ft or "<empty>"))
        print("Buffer type: " .. (vim.bo[bufnr].buftype ~= "" and vim.bo[bufnr].buftype or "<empty>"))
        
        -- Check if config exists
        if vim.lsp.config and vim.lsp.config.rust_analyzer then
          print("rust_analyzer config exists in vim.lsp.config")
        else
          print("rust_analyzer config NOT found in vim.lsp.config")
        end
        
        -- Try to manually start LSP
        print("\nTry running :StartLSP to manually start LSP for this buffer")
      end, {})
      
      -- Add a command to manually start LSP
      vim.api.nvim_create_user_command("StartLSP", function()
        local bufnr = vim.api.nvim_get_current_buf()
        maybe_start_lsp(bufnr)
        
        -- Check if it worked
        vim.schedule(function()
          local clients = vim.lsp.get_clients({ bufnr = bufnr })
          if #clients > 0 then
            vim.notify("LSP clients attached: " .. #clients, vim.log.levels.INFO)
            for _, client in ipairs(clients) do
              print("  - " .. client.name)
            end
          else
            vim.notify("No LSP clients attached after manual start", vim.log.levels.WARN)
          end
        end)
      end, {})

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
  -- Note: vim.g.vimwiki_list is configured in init.lua using VIM_WIKI_PATHS env var
  {
    "vimwiki/vimwiki",
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
