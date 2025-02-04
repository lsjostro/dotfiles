{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.broot = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      content_search_max_file_size = "10MB";
      enable_kitty_keyboard = lib.mkForce true;
      icon_theme = "nerdfont";
      lines_before_match_in_preview = 1;
      lines_after_match_in_preview = 1;
      quit_on_last_cancel = true;
      show_selection_mark = true;
      special_paths = {
        "~/media" = {
          list = "never";
          sum = "never";
        };
        "~/.config" = {
          show = "always";
        };
        "trav" = {
          show = "always";
          list = "always";
          sum = "never";
        };
      };
      true_colors = true;

      verbs = [
        {
          invocation = "broot_home";
          key = "ctrl-7";
          external = "br $HOME";
          from_shell = true;
          leave_broot = true;
        }
        {
          invocation = "edit";
          key = "enter";
          shortcut = "e";
          external = "edit {file}";
          apply_to = "text_file";
          from_shell = true;
          leave_broot = true;
        }
        {
          invocation = "nvim";
          key = "enter";
          apply_to = "text_file";
          external = "edit {file}";
          from_shell = true;
          leave_broot = true;
        }
      ];
    };
  };
}
