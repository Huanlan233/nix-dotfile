{ config, pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs = [
      "--disable-features=NetworkServiceSandbox"
      "--enable-features=ApiMimeHandler"
      "--enable-zero-copy"
      "--enable-mime-handler-view"
    ];
  };
}
