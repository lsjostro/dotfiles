{
  pkgs,
  ...
}:
{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installBatSyntax = false;
    package = pkgs.emptyDirectory;
    themes = {

      PatagiaLight = {
        background = "#fefeff";
        foreground = "#222222";
        cursor-color = "#aa0000";
        selection-background = "#ffe6a4";
        selection-foreground = "#483600";
        palette = [
          "0=#000000"
          "1=#9e001d"
          "2=#306300"
          "3=#deae00"
          "4=#00669e"
          "5=#7d009e"
          "6=#008a9e"
          "7=#cdcdcd"
          "8=#b0b0b0"
          "9=#ff0035"
          "10=#509e00"
          "11=#ffc900"
          "12=#00a7ff"
          "13=#cb01ff"
          "14=#00e0ff"
          "15=#ffffff"
        ];
      };

      PatagiaDark = {
        background = "#000000";
        foreground = "#b7bec7";
        cursor-color = "#e7e7b7";
        selection-background = "#84979f";
        selection-foreground = "#000000";
        palette = [
          "0=#000000"
          "1=#ff0035"
          "2=#85ff00"
          "3=#ffc900"
          "4=#00a7ff"
          "5=#cb01ff"
          "6=#00e0ff"
          "7=#b7bec7"
          "8=#444444"
          "9=#ff8c88"
          "10=#baff94"
          "11=#ffe090"
          "12=#88ccff"
          "13=#e38dff"
          "14=#97eeff"
          "15=#ffffff"
        ];
      };

    };
    settings = {
      font-size = 10.5;
      font-family = "TX-02";
      font-family-bold-italic = "Monaspace Xenon";
      font-style-bold = "Bold";
      font-style-italic = "Light Oblique";
      font-style-bold-italic = "ExtraLight Italic";
      font-synthetic-style = false;

      adjust-cursor-thickness = 4;
      adjust-underline-position = 5;
      adjust-underline-thickness = -2;

      mouse-hide-while-typing = true;
      unfocused-split-opacity = 1.0;

      shell-integration = "fish";

      gtk-tabs-location = "hidden";
      gtk-titlebar = false;
      window-padding-balance = true;
      window-padding-color = "extend";
      window-height = 60;
      window-width = 160;
      window-theme = "system";
      theme = "light:PatagiaLight,dark:PatagiaDark";

      keybind = [
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+i=text:\\x09"
        "ctrl+m=text:\\x0D"
        "ctrl+tab=goto_split:previous"
        "ctrl+[=text:\\x1B"
        "super+enter=toggle_fullscreen"
        "ctrl+enter=unbind"
        "alt+one=unbind"
        "alt+two=unbind"
        "alt+three=unbind"
        "alt+four=unbind"
        "alt+five=unbind"
        "alt+six=unbind"
        "alt+seven=unbind"
        "alt+eight=unbind"
        "alt+nine=unbind"
      ];
    };
  };
}
