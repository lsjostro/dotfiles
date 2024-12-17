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
    '';
  };
}
