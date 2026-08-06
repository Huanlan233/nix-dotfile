{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    colorschemes = {
      onedark = {
        enable = true;
        autoLoad = true;
      };
    };

    opts = {
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      smartindent = true;
      number = true;
      relativenumber = true;
    };

    keymaps = [
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>e";
      }
      {
        action = "<cmd>bn<CR>";
        key = "<C-Tab>";
      }
      {
        action = "<cmd>bp<CR>";
        key = "<C-S-Tab>";
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
      };

      nvim-autopairs = {
        enable = true;
        autoLoad = true;
      };
    };
  };
}
