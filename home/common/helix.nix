{
  pkgs,
  ...
}:
{

  programs.helix = {
    enable = true;
    defaultEditor = true;
    ignores = [
      "!.jj"
    ];
    settings = {
      theme = "github_light";
      editor = {
        color-modes = true;
        line-number = "relative";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        inline-diagnostics = {
          cursor-line = "hint";
        };
        cursorline = true;
        true-color = true;
        undercurl = true;
      };
      keys.normal = {
        space.q = ":buffer-close";
      };
    };
  };
}
