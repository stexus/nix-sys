{config, ...}:
let host = "yoru";
in
{
  programs.ssh = {
  enable = true;
	addKeysToAgent = "yes";
	matchBlocks = {
		"github.com" = {
			identityFile = "${config.home.homeDirectory}/.ssh/${host}_ed25519";
		};
	};
  };
}
