{ config, lib, ... }:

let
  cfg = config.settings.nixos.system.env;
in
{
  options.settings.nixos.system.env = {
    pathsToLink = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        description = "Paths to link.";
    };

    sessionVars = lib.mkOption {
        type  = lib.types.attrsOf lib.types.anything;
        default = {};
        description = "Environment Variables for Session";
    };

    vars = lib.mkOption {
        type  = lib.types.attrsOf lib.types.anything;
        default = {};
        description = "Environment Variables.";
    };

    sysPkgs = lib.mkOption {
        type = lib.types.listOf lib.types.package;
        default = [];
        description = "Environment System Packages";
    };
  };

  config = {
    environment.pathsToLink = cfg.pathsToLink;
    environment.sessionVariables = cfg.sessionVars;
    environment.variables = cfg.vars;
    environment.systemPackages = lib.mkAfter cfg.sysPkgs;
  };
}
