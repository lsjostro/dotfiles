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
        foreground = "#1f2328";
        cursor-color = "#cf222e";
        selection-background = "#ffe6a4";
        selection-foreground = "#483600";
        palette = [
          "0=#24292f"
          "1=#cf222e"
          "2=#116329"
          "3=#4d2d00"
          "4=#0969da"
          "5=#8250df"
          "6=#1b7c83"
          "7=#6e7781"
          "8=#57606a"
          "9=#a40e26"
          "10=#1a7f37"
          "11=#633c01"
          "12=#218bff"
          "13=#a475f9"
          "14=#3192aa"
          "15=#8c959f"
        ];
      };

      PatagiaDark = {
        background = "#0d1117";
        foreground = "#e6edf3";
        cursor-color = "#e7e7b7";
        selection-background = "#84979f";
        selection-foreground = "#000000";
        palette = [
          "0=#484f58"
          "1=#ff7b72"
          "2=#3fb950"
          "3=#d29922"
          "4=#58a6ff"
          "5=#bc8cff"
          "6=#39c5cf"
          "7=#b1bac4"
          "8=#6e7681"
          "9=#ffa198"
          "10=#56d364"
          "11=#e3b341"
          "12=#79c0ff"
          "13=#d2a8ff"
          "14=#56d4dd"
          "15=#ffffff"
        ];
      };

    };
    settings = {
      font-size = 10;
      # font-family = "Berkeley Mono";
      # font-family-italic = "Monaspace Radon Var";
      # font-family-bold-italic = "Monaspace Krypton Var";
      # font-style = "SemiCondensed";
      # font-style-bold = "Bold SemiCondensed";
      # font-style-italic = "ExtraLight Italic";
      # font-style-bold-italic = "ExtraLight";
      # font-synthetic-style = false;
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
