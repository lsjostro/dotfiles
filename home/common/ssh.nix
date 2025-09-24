{ ... }:
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    extraConfig = ''
      PreferredAuthentications publickey
      Include ~/.ssh/private_config
    '';
    matchBlocks."*" = {
      addKeysToAgent = "yes";
      compression = false;
      controlMaster = "auto";
      controlPath = "\${XDG_RUNTIME_DIR}/ssh_control:%h:%p:%r";
      controlPersist = "15m";
      forwardAgent = false;
      hashKnownHosts = false;
      serverAliveCountMax = 3;
      serverAliveInterval = 0;
      userKnownHostsFile = "~/.ssh/known_hosts";
    };
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
