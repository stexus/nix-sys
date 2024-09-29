{config, pkgs, ... }:
let symLink = config.lib.file.mkOutOfStoreSymlink;
    cfg_dir = "${config.home.homeDirectory}/.dotfiles/home/massimo/shared/config";
in
{
	 programs.zsh = {
	 	enable = true;
	 	shellAliases = {
		  l ="eza -aF --oneline --icons --color=always --group-directories-first";
		  ls="eza --icons --color=always --group-directories-first";
		  ll="eza -alF --icons --color=always --group-directories-first";
		  la="eza -a --icons --color=always --group-directories-first";
		  hms="home-manager switch --flake /home/massimo/.dotfiles/.#massimo@yoru";
		  edithm="nvim /home/massimo/.dotfiles/home/massimo/shared/home.nix";
	  };
    antidote = {
      enable = true;
      plugins = [
          "softmoth/zsh-vim-mode"
          "MichaelAquilina/zsh-you-should-use"
          "romkatv/zsh-bench kind:path"
          "olets/zsh-abbr    kind:defer"
          "zsh-users/zsh-completions kind:fpath path:src"
          "zsh-users/zsh-autosuggestions"
          "zsh-users/zsh-syntax-highlighting"
          "zsh-users/zsh-history-substring-search"
      ];
    };
    sessionVariables = {
      LS_COLORS = "$(vivid generate catppuccin-mocha)";
    };
    initExtra = ''
          function n() {
          	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
          	yazi "$@" --cwd-file="$tmp"
          	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          		builtin cd -- "$cwd"
          	fi
          	rm -f -- "$tmp"
          }
    '';
	};
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "${cfg_dir}/ohmyposh/catpuccin.json"));
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.ssh = {
  	enable = true;
	addKeysToAgent = "yes";
	matchBlocks = {
		"github.com" = let host = "yoru"; in {
			identityFile = "/home/massimo/.ssh/${host}_ed25519";
		};
	};
  };

  programs.fzf = {
  	enable = true;
	tmux.enableShellIntegration = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;




  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # symlink to the Nix store copy.
    ".tmux.conf".source = symLink "${cfg_dir}/.tmux.conf";
    #".zshrc".source = symLink "${cfg_dir}/.zshrc";

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  xdg.configFile = {
  	"nvim" = {
        	recursive = true;
        	source = symLink "${cfg_dir}/nvim";
        };
  };
  xdg.configFile = {
  	"ohmyposh" = {
        	recursive = true;
        	source = symLink "${cfg_dir}/ohmyposh";
        };
  };
  xdg.configFile = {
  	"yazi" = {
        	recursive = true;
        	source = symLink "${cfg_dir}/yazi";
        };
  };
   
}
