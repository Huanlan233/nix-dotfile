{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.chromexup.homeManagerModules.default
  ];

  programs.chromexup = {
    enable = true;
    extensions = {
      uBO = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
    };
  };
  
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs = [
      "--disable-features=NetworkServiceSandbox"
      "--extension-mime-request-handling=always-prompt-for-install"
      "--enable-zero-copy"
      "--enable-mime-handler-view"
    ];
  };
}
