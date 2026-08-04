# NixOS dotfiles

This flake separates reusable NixOS modules from machine and user-specific
configuration. It is designed to stay pure: no `builtins.getEnv`, no absolute
user-specific values in shared modules, and no `--impure` requirement.

## Layout

```text
hosts/              Machine-specific configuration
  shared/           Common NixOS foundation shared by all hosts
  vMachine/         Example machine
homes/              Home Manager configuration
  shared/           Common home settings shared by all users
  <name>/           Per-user nix and Home Manager config
modules/
  nixos/            Reusable NixOS modules
    default.nix     Recursively imports all NixOS module files
    system/         OS-level basics: locale, network, nix settings
    desktop/        Display manager, greeter, compositor, shell, input method
      display-manager.nix
      display-managers/greetd.nix
      greeter.nix
      greeters/tuigreet.nix
      greeters/dankgreeter.nix
      compositor.nix
      compositors/niri.nix
      shell.nix
      shells/dms.nix
      shells/noctalia.nix
      input-method.nix
      input-methods/fcitx5.nix
      input-methods/ibus.nix
    hardware/       Hardware enablement
    services/       Home Manager, secrets, background services
  home/             Reusable Home Manager modules
    default.nix     Recursively imports all Home Manager module files
    editors/        Editor configuration
secrets/            Agenix secrets and public keys
```

## Module options

Each module is exposed as an option under `settings`. For example, the
vMachine configuration enables modules with:

```nix
settings.nixos.desktop.compositor.enable = true;
settings.nixos.services.homeManager.enable = true;
settings.home.editors.nixvim.enable = true;
```

The display manager is enabled with:

```nix
settings.nixos.desktop.displayManager = {
  enable = true;
  type = "greetd";
};

settings.nixos.desktop.greeter = {
  enable = true;
  type = "tuigreet"; # or "dankgreeter"
};

settings.nixos.desktop.compositor = {
  enable = true;
  type = "niri";
};

settings.nixos.desktop.shell = {
  enable = true;
  type = "dms";
};

settings.nixos.desktop.inputMethod = {
  enable = true;
  type = "fcitx5"; # or "ibus"
};
```

Most modules are off by default and only apply their config when the matching
`enable` option is set to `true`; `compositor.enable` defaults to `true`.

## Add a machine

Create `hosts/<machine>/configuration.nix` and optionally a
`hardware-configuration.nix`. The flake automatically exposes every directory
under `hosts/` except `shared` as a `nixosConfiguration`.

## Add a user

Create `homes/<name>/user.nix` to define the NixOS account. Optionally create
`homes/<name>/default.nix` for Home Manager personal configuration. Both files
are auto-discovered: `user.nix` generates the system user, and `default.nix` is
imported by Home Manager with `home.username` and `home.homeDirectory` injected
automatically.

User applications and user-level configuration stay under `homes/`; they are
installed through the user profile so system packages remain system-only.
