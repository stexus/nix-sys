{ config, lib, pkgs, ... }:
{
	imports = [ ./shared/home.nix ./shared/programs.nix ./extras/yoru/programs.nix];
  home.homeDirectory = "/home/massimo";
}
