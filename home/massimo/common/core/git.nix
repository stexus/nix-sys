{config, ...}:
{
  programs.git = {
    enable = true;
    userEmail = "massimo.tseng@gmail.com";
    userName = "Massimo Tseng";
    extraConfig = {
      rerere = {
        enabled = true;
      };
    };
  };

}
