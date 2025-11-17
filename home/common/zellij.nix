{
  pkgs,
  ...
}:
{

  programs.zellij = {
    enable = true;

    layouts = {

      devel = {
        layout = {
          default_tab_template = {
            children = [ ];
            pane = {
              size = 1;
              borderless = true;
              plugin = {
                location = "zellij:compact-bar";
                tooltip = "Alt -";
              };
            };
          };
          tab_template = {
            _props = {
              name = "helix";
            };
            pane = {
              command = "hx";
            };
          };
          helix = {
            _props = {
              name = "edit";
            };
          };
          tab = {
            _props = {
              name = "shell";
            };
          };
        };
      };

      zsm = {
        layout = {
          pane = {
            borderless = true;
            plugin = {
              location = "file:~/.config/zellij/plugins/zsm.wasm";
              floating = true;
              move_to_focused_tab = true;
              default_layout = "devel";
            };
          };
        };
      };

    };

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
        compact-bar = {
          _props.location = "zellij:compact-bar";
          tooltip = "Alt -";
        };
        tab-bar.path = "tab-bar";
        status-bar.path = "status-bar";
        strider.path = "strider";
      };

      keybinds = {
        shared = {
          "bind \"Alt 1\"".GoToTab = 1;
          "bind \"Alt 2\"".GoToTab = 2;
          "bind \"Alt 3\"".GoToTab = 3;
          "bind \"Alt 4\"".GoToTab = 4;
          "bind \"Alt 5\"".GoToTab = 5;
          "bind \"Alt 6\"".GoToTab = 6;
          "bind \"Alt 7\"".GoToTab = 7;
          "bind \"Alt 8\"".GoToTab = 8;
          "bind \"Alt 9\"".GoToTab = 9;
          "bind \"Alt 0\"".GoToTab = 10;
          "bind \"Alt `\"".ToggleFloatingPanes = { };
          "bind \"Alt Esc\"".ToggleFloatingPanes = { };
          "bind \"Alt s\""."LaunchOrFocusPlugin \"file:~/.config/zellij/plugins/zsm.wasm\"" = {
            floating = true;
            move_to_focused_tab = true;
            default_layout = "devel";
          };
          "bind \"Alt /\""."LaunchOrFocusPlugin \"file:~/.config/zellij/plugins/forgot.wasm\"" = {
            LOAD_ZELLIJ_BINDINGS = true;
            floating = true;
          };
          "unbind \"Alt f\"" = { };
          "unbind \"Ctrl p\"" = { };
          # Crusial in helix
          "unbind \"Alt o\"" = { };
          "unbind \"Alt i\"" = { };
        };
        "shared_except \"session\"" = {
          "unbind \"Ctrl q\"" = { };
        };
      };

    };
  };

  home.file.".config/zellij/plugins/zsm.wasm".source = pkgs.fetchurl {
    url = "https://github.com/liam-mackie/zsm/releases/download/v0.4.1/zsm.wasm";
    sha256 = "sha256-+VCf9MEHQVmr2q8lu95jAOsvCQU0iJa3ljqbnIC9ywg=";
  };

  home.file.".config/zellij/plugins/forgot.wasm".source = pkgs.fetchurl {
    url = "https://github.com/karimould/zellij-forgot/releases/download/0.4.2/zellij_forgot.wasm";
    sha256 = "sha256-MRlBRVGdvcEoaFtFb5cDdDePoZ/J2nQvvkoyG6zkSds=";
  };
}
