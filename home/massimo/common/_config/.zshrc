setopt histignorealldups sharehistory
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

function n() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# source antidote
source ${HOME}/.antidote/antidote.zsh 2>/dev/null

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load 2>/dev/null

export LS_COLORS="$(vivid generate catppuccin-mocha 2>/dev/null)"

export VISUAL=nvim
export EDITOR=nvim
export PATH
eval "$(oh-my-posh init zsh --config ${HOME}/.config/ohmyposh/catpuccin.json)"  2>/dev/null
eval "$(zoxide init zsh 2>/dev/null)" 
