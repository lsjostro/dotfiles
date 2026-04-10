{
  lib,
  pkgs,
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

      plugins = {
        zjstatus.path = "file:~/.config/zellij/plugins/zjstatus.wasm";
      };
    };
    extraConfig = builtins.readFile ./zellij.config.kdl;

    layouts = {

      devel = {
        layout = {
          default_tab_template = {
            children = [ ];
            pane = {
              size = 1;
              borderless = true;
              plugin = {
                location = "file:~/.config/zellij/plugins/zjstatus.wasm";
                border_enabled = false;
                hide_frame_for_single_pane = true;
                format_left = "#[fg=#777777,reverse]{mode} #[fg=#777777,reverse]{tabs}#[fg=#777777,reverse]:{session}@{command_hostname}";
                format_center = "#[fg=#777777,reverse]";
                format_right = "#[fg=#777777,reverse]{datetime}";
                format_space = "#[fg=#777777,reverse]";

                mode_normal = "  ";
                mode_locked = "  ";
                mode_resize = " 󰩨 ";
                mode_pane = "  ";
                mode_tab = "  ";
                mode_scroll = " 󱕒 ";
                mode_session = "  ";
                mode_move = " 󰆾 ";

                tab_normal = "";
                tab_active = "#[fg=#777777,reverse,bold]{index}";

                command_hostname_command = "hostname -s";
                command_hostname_format = "#[fg=#777777,reverse]{stdout}";
                command_hostname_rendermode = "static";
                command_hostname_interval = "0";

                datetime = "#[fg=#777777,reverse,italic] {format}";
                datetime_format = "%R";
                datetime_timezone = "Europe/Stockholm";
              };
            };
          };
          _children = [
            { tab._props.name = "1"; }
            { tab._props.name = "2"; }
            { tab._props.name = "3"; }
          ];

          swap_floating_layout = {
            _children = [
              {
                floating_panes = {
                  _props.max_panes = 1;
                  _children = [
                    {
                      pane = {
                        x = "5%";
                        y = "5%";
                        width = "90%";
                        height = "90%";
                      };
                    }
                  ];
                };
              }

              {
                floating_panes = {
                  _props.max_panes = 2;
                  _children = [
                    {
                      pane = {
                        x = "4%";
                        y = "5%";
                        width = "45%";
                        height = "90%";
                      };
                    }

                    {
                      pane = {
                        x = "51%";
                        y = "5%";
                        width = "45%";
                        height = "90%";
                      };
                    }
                  ];
                };
              }
            ];
          };
        };
      };

    };

  };

  home.file.".config/zellij/plugins/forgot.wasm".source = pkgs.fetchurl {
    url = "https://github.com/karimould/zellij-forgot/releases/download/0.4.2/zellij_forgot.wasm";
    sha256 = "sha256-MRlBRVGdvcEoaFtFb5cDdDePoZ/J2nQvvkoyG6zkSds=";
  };
  home.file.".config/zellij/plugins/zjstatus.wasm".source = pkgs.fetchurl {
    url = "https://github.com/dj95/zjstatus/releases/download/v0.22.0/zjstatus.wasm";
    sha256 = "sha256-TeQm0gscv4YScuknrutbSdksF/Diu50XP4W/fwFU3VM=";
  };
}
