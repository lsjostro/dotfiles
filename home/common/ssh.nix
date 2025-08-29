{ ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    compression = false;
    controlMaster = "auto";
    controlPath = "\${XDG_RUNTIME_DIR}/ssh_control:%h:%p:%r";
    controlPersist = "15m";
    extraConfig = ''
      PreferredAuthentications publickey
      Include ~/.ssh/private_config
    '';
  };

  home.file = {
    ".ssh/rc" = {
      source = ./../../files/scripts/ssh-rc;
    };
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/gcr/ssh";
  };
}
