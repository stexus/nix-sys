{config, ...}:
let symLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  xdg.configFile = {
  	"ohmyposh" = {
        	recursive = true;
        	source = symLink ././config;
        };
  };
}
