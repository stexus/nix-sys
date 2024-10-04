{config, ...}:
{
  home.file = {
    ".tmux.conf".source = symLink "${cfg_dir}/.tmux.conf";
  };
}
