{ config, lib, ... }:

{
  users.users.huan = {
    isNormalUser = true;
    description = "Huan";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [ ];
  };
}
