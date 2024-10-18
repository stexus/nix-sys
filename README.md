## Setup (on non NixOS system)
1. Install nix via [Determinate Installer](https://github.com/DeterminateSystems/nix-installer)
2. Install Home Manager (standalone). If having problems with /nix/ permissions just chown it to $USER
3. Clone and switch
```sh
nix run nixpkgs#gh -- auth login
nix run nixpkgs#gh -- repo clone stexus/nix-sys ~/.dotfiles
nix run home-manager -- switch --flake ~/.dotfiles#massimo@yoru

```
4. Change default shell to zsh

## NixOS
1. Clone and switch!
