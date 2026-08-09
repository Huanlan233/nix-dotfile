{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.ignorePatterns = [
      "rm *"
      "cp *"
      "pkill *"
    ];

    plugins = [
      {
        name = "zsh-autosuggestion";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "zsh-autocomplete";
        src = pkgs.zsh-autocomplete;
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
      }
    ];

    zprof.enable = false;

    #initContent = ''
    #  zstyle ':antidote:*' zcompile 'yes'
    #'';
  };
}
