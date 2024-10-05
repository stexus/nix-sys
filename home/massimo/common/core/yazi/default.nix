{config, ...}:
let symLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  xdg.configFile = {
  	"yazi" = {
        	recursive = true;
        	source = symLink ././config;
        };
  };
}
