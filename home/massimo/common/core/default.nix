{ config, pkgs, cfglib, ... }:

{
  imports = (cfglib.scanPaths ./.);
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "massimo";
  #this will be set within each host 
  #home.homeDirectory = "/home/massimo"

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.sessionVariables = {
     EDITOR = "nvim";
     VISUAL = "nvim";
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # # The home.packages option allows you to install Nix packages into your
  # # environment.
  home.packages = with pkgs; [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
        # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    yazi # terminal file manager
    tmux
    sesh
    #neovim
    gcc
    oh-my-posh
    lua
    lazygit
    vivid
    # archives
    zip
    xz
    unzip
    p7zip
    ripgrep # recursively searches directories for a regex pattern
    eza # A modern replacement for ‘ls’
    cowsay
    file
    which
    tree
    #nix-output-monitor
    btop 
  ];
}
