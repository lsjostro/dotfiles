{ lib, pkgs, ... }:
{
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      ctrl_n_shortcuts = true;
      enter_accept = true;
      filter_mode_shell_up_key_binding = "session";
      history_filter = [ ];
      inline_height = 10;
      prefers_reduced_motion = true;
      search_mode_shell_up_key_binding = "prefix";
      show_help = false;
      style = "compact";
      sync_address = "https://atuin.patagia.net";
      sync.records = true;

      daemon = {
        enabled = false;
        socket_path = "/run/user/1000/atuin.socket"; # FIXME: remove hard coded uid
        systemd_socket = false;
      };

      stats.common_subcommands = [
        "cargo"
        "git"
        "go"
        "jj"
        "just"
        "kubectl"
        "nix"
        "npm"
        "pnpm"
        "talosctl"
        "task"
        "yarn"
      ];

      stats.common_prefix = [
        "doas"
        "sudo"
      ];
    };
  };

  # systemd.user.services.atuin-daemon = {
  #   Unit = {
  #     Description = "atuin shell history daemon";
  #     Requires = [ "atuin-daemon.socket" ];
  #   };
  #   Service = {
  #     ExecStart = "${lib.getExe pkgs.atuin} daemon";
  #     Environment = [ "ATUIN_LOG=info" ];
  #     Restart = "on-failure";
  #     RestartSteps = 5;
  #     RestartMaxDelaySec = 10;
  #   };
  #   Install = {
  #     Also = [ "atuin-daemon.socket" ];
  #     WantedBy = [ "default.target" ];
  #   };
  # };
  #
  # systemd.user.sockets.atuin-daemon = {
  #   Unit = {
  #     Description = "Unix socket activation for atuin shell history daemon";
  #   };
  #
  #   Socket = {
  #     ListenStream = "%t/atuin.socket";
  #     SocketMode = "0600";
  #     RemoveOnStop = true;
  #   };
  #
  #   Install = {
  #     WantedBy = [ "sockets.target" ];
  #   };
  # };
}
