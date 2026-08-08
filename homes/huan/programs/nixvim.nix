{ config, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    colorschemes = {
      nord.enable = true;
    };

    opts = {
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      smartindent = false; # Stupid Indent
      number = true;
      relativenumber = true;
      termguicolors = true;
    };

    keymaps = [
      # Control: About window or other etc
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<C-e>";
      }

      ## Bufferline Control
      {
        action = "<cmd>BufferLineCycleNext<CR>";
        key = "<C-Tab>";
      }
      {
        action = "<cmd>BufferLineCyclePrev<CR>";
        key = "<C-S-Tab>";
      }
      {
        action = "<cmd>Bwipeout<CR>";
        key = "<C-F4>";
      }

      ## Windows Change
      {
        action = "<cmd>wincmd k<CR>";
        key = "<C-S-Up>";
      }
      {
        action = "<cmd>wincmd j<CR>";
        key = "<C-S-Down>";
      }
      {
        action = "<cmd>wincmd l<CR>";
        key = "<C-S-Right>";
      }
      {
        action = "<cmd>wincmd h<CR>";
        key = "<C-S-Left>";
      }
      {
        action = "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + .1<CR>";
        key = "<C-=>";
      }
      {
        action = "<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - .1<CR>";
        key = "<C-->";
      }

      ## Telescope
      {
        action = "<cmd>Telescope fd<CR>";
        key = "<C-f>";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<C-A-f>";
      }

      # Alt: About single file or other etc
      ## Find
      {
        action = "<cmd>Telescope current_buffer_fuzzy_find<CR> ";
        key = "<A-f>";
      }
    ];

    globals.mapleader = ";";

    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy.enable = true;
      };
    };

    lsp = {
      inlayHints = {
        enable = true;
      };
    };

    plugins = {
      lualine = {
        enable = true;
        autoLoad = true;
      };

      neo-tree = {
        enable = true;
        autoLoad = true;
      };

      cursorline = {
        enable = true;
        autoLoad = true;
      };

      repeat = {
        enable = true;
        autoLoad = true;
      };

      lsp = {
        enable = true;
      };

      bufferline = {
        enable = true;
        settings.options = {
          show_buffer_icons = true;
          show_buffer_close_icons = true;
          show_close_icon = true;
          show_tab_indicators = true;
          offsets = [
            { filetype = "neo-tree"; highlight = "Directory"; text = "File Explorer"; text_align = "center"; }
          ];
        };
      };

      bufdelete = {
        enable = true;
      };

      nvim-autopairs = {
        enable = true;
        autoLoad = true;
      };

      gitsigns = {
        enable = true;
      };

      mini-move = {
        enable = true;
        settings = {
          mappings = {
            up = "<A-Up>";
            down = "<A-Down>";
            right = "<A-Right>";
            left = "<A-Left>";
            line_up = "<A-Up>";
            line_down = "<A-Down>";
            line_right = "<A-Right>";
            line_left = "<A-Left>";
          };
        };
      };

      telescope = {
        enable = true;
      };

      blink-ripgrep = {
        enable = true;
      };

      blink-indent = {
        enable = true;
      };

      blink-pairs = {
        enable = true;
      };

      blink-cmp = {
        enable = true;
      };

      treesitter = {
        enable = true;
        indent.enable = true;
        folding.enable= false;
        highlight.enable = true;
        grammarPackages = config.programs.nixvim.plugins.treesitter.package.all;
        nixGrammars = true;
      };
    };

    dependencies = {
      ripgrep = {
        enable = true;
      };

      fd = {
        enable = true;
      };
    };
  };
}
