{
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    inputs.niri.nixosModules.niri
    inputs.nixvim.nixosModules.nixvim
    inputs.dms.nixosModules.dank-material-shell
  ];

  programs = {
    niri = {
      enable = true;
    };

    #noctalia = {
    #  enable = true;
    #  recommendedServices.enable = true;
    #  systemd.enable = true;
    #};

    dank-material-shell = {
      enable = true;

      systemd = {
        enable = true;
        restartIfChanged = true;
      };

      enableSystemMonitoring = true;
      enableVPN = true;
      enableDynamicTheming = true;
      enableCalendarEvents = true;
    };

    nixvim = {
      enable = true;
      defaultEditor = true;
      opts = {
        tabstop = 4;
        shiftwidth = 4;
        expandtab = true;
        smartindent = true;
        number = true;
        relativenumber = true;
      };
    };

    nautilus-open-any-terminal = {
      enable = true;
      terminal = "alacritty";
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };

    chromium = {
      enable = true;
      extraOpts = {
        DefaultSearchProviderEnabled = true;
        DefaultSearchProviderName = "Bing";
        DefaultSearchProviderIconURL = "https://www.bing.com/favicon.ico";
        DefaultSearchProviderSearchURL = "https://www.bing.com/search?q={searchTerms}";
        DefaultSearchProviderSuggestURL = "https://www.bing.com/osjson.aspx?query={searchTerms}";
      };
    };

    steam = {
      enable = true;
      extest.enable = true;
    };
  };
}
