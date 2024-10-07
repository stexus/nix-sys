## Setup

```sh
nix run nixpkgs#gh -- auth login
nix run nixpkgs#gh -- repo clone stexus/nix-sys ~/.dotfiles
nix run home-manager -- switch --flake ~/.dotfiles#massimo@yoru
```
