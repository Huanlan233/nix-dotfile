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
    };
  };
}
