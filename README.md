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
  users/<name>/     Optional per-user Home Manager config
modules/
  nixos/            Reusable NixOS modules
<<<<<<< HEAD
=======
    default.nix     Recursively imports all NixOS module files
>>>>>>> 9542c8e (perf: Options with modules)
    system/         OS-level basics: locale, network, nix settings
    desktop/        Display manager, compositor, input method
    hardware/       Hardware enablement
    services/       Home Manager, secrets, background services
  home/             Reusable Home Manager modules
<<<<<<< HEAD
=======
    default.nix     Recursively imports all Home Manager module files
>>>>>>> 9542c8e (perf: Options with modules)
    editors/        Editor configuration
secrets/            Agenix secrets and public keys
```

<<<<<<< HEAD
=======
## Module options

Each module is exposed as an option under `settings`. For example, the
vMachine configuration enables modules with:

```nix
settings.nixos.desktop.niri.enable = true;
settings.nixos.services.homeManager.enable = true;
settings.home.editors.nixvim.enable = true;
```

Every module is off by default and only applies its config when the matching
`enable` option is set to `true`.

>>>>>>> 9542c8e (perf: Options with modules)
## Add a machine

Create `hosts/<machine>/configuration.nix` and optionally a
`hardware-configuration.nix`. The flake automatically exposes every directory
under `hosts/` except `shared` as a `nixosConfiguration`.

## Add a user

Define a normal user in `hosts/shared/users.nix` or in a host config. Home
Manager automatically picks up every `isNormalUser` and injects
`home.username` and `home.homeDirectory`. Optional personal configuration can
be added under `homes/users/<name>/default.nix`.

User applications and user-level configuration stay under `homes/`; they are
installed through the user profile so system packages remain system-only.
