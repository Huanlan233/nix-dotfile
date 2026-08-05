{
  config,
  inputs,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users = {
    "huan" = {
      isNormalUser = true;
      description = "Huan";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      openssh.authorizedKeys.keys = [ ];
    };
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = false;

    sharedModules = [
      {
        home.stateVersion = lib.mkDefault "26.05";
      }
    ];

    users = {
      "huan" = import ../../homes/huan;
    };
  };
}
