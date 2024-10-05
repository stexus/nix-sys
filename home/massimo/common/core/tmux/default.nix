{config, ...}:
let symLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file = {
    ".tmux.conf".source = symLink ./.tmux.conf;
  };
}
