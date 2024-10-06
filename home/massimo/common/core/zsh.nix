{config, lib, pkgs, ... }:

{

     programs.zsh = {
	 	enable = true;
	 	shellAliases = {
		  l ="eza -aF --oneline --icons --color=always --group-directories-first";
		  ls="eza --icons --color=always --group-directories-first";
		  ll="eza -alF --icons --color=always --group-directories-first";
		  la="eza -a --icons --color=always --group-directories-first";
		  hms="home-manager switch --flake ${config.home.homeDirectory}/.dotfiles/.#massimo@yoru";
      # cnix -> change nix
		  cnix="nvim ${config.home.homeDirectory}/.dotfiles/";
      lg="lazygit";
	  };
    antidote = {
      enable = true;
      plugins = [
          "jeffreytse/zsh-vi-mode"
          "MichaelAquilina/zsh-you-should-use"
          "romkatv/zsh-bench kind:path"
          "olets/zsh-abbr    kind:defer"
          "zsh-users/zsh-completions kind:fpath path:src"
          "zsh-users/zsh-autosuggestions"
          "zsh-users/zsh-syntax-highlighting"
          "zsh-users/zsh-history-substring-search"
      ];
    };
    # init ohmyposh and get the yazi alias
    initExtra = ''
          function n() {
          	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
          	yazi "$@" --cwd-file="$tmp"
          	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          		builtin cd -- "$cwd"
          	fi
          	rm -f -- "$tmp"
          }
          eval "$(oh-my-posh init zsh --config ${config.home.homeDirectory}/.config/ohmyposh/catpuccin.json)"  2>/dev/null
          export LS_COLORS="$(vivid generate catppuccin-mocha)"
    ''; 
	};

}
