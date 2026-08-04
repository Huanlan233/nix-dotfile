{ config, lib, ... }:

{
    isNormalUser = true;
    description = "Huan";
    extraGroups = [ "networkmanager" "wheel" ];
    openssh.authorizedKeys.keys = [ ];
}
