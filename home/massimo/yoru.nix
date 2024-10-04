{ config, lib, pkgs, ... }:

{
	imports = [ 
		common/core
	];

  	home.homeDirectory = "/home/massimo";
}
