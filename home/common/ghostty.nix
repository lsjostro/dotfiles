{
  pkgs,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    systemd.enable = false;
    installBatSyntax = false;
    package = pkgs.emptyDirectory;

    settings = {
      font-size = 11;
      font-family = "Go Mono";

      adjust-cell-height = 6;
      adjust-font-baseline = 1;
      adjust-cursor-thickness = 4;
      adjust-underline-position = 5;
      adjust-underline-thickness = -2;

      mouse-hide-while-typing = true;
      unfocused-split-opacity = 0.9;
      unfocused-split-fill = "#056157";

      shell-integration = "fish";

      gtk-tabs-location = "hidden";
      gtk-titlebar = false;
      window-padding-balance = true;
      window-padding-color = "extend";
      window-padding-x = 10;
      window-padding-y = 10;
      window-height = 60;
      window-width = 160;
      window-theme = "system";

      theme = "light:GitHub Light High Contrast,dark:GitHub Dark High Contrast";

    };
  };
}
