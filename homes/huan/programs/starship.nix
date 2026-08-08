{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = ''
        $directory$all$character
      '';
      directory = {
        truncate_to_repo = false;
        read_only = "[ReadOnly]";
        disabled = false;
      };
      
      git_branch = {
        format = "$symbol$branch($style)";
        disabled = false;
      };
    };
  };
}
