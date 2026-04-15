{
  ...
}:
{

  programs.zellij = {
    enable = true;
    settings = {
      default_layout = "devel";
      pane_frames = false;
      show_startup_tips = false;
      theme = "iceberg-light";

      ui.pane_frames = {
        hide_session_name = true;
        rounded_corners = true;
      };

    };
    extraConfig = builtins.readFile ./zellij.config.kdl;

    layouts = {

      devel = {
        layout = {
          _children = [
            { tab._props.name = "1"; }
            { tab._props.name = "2"; }
            { tab._props.name = "3"; }
          ];
        };
      };

    };

  };
}
