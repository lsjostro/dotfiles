{ pkgs , ... }:
{
  environment.systemPackages = [ pkgs.doas-sudo-shim pkgs.git ];

  # Use fish, but not in /etc/passwd. See https://nixos.wiki/wiki/Fish#Setting_fish_as_your_shell
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
    shellInit = ''
      export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')
    '';
  };

  security = {
    doas = {
      enable = true;
      extraRules = [
        {
          groups = [ "wheel" ];
          keepEnv = true;
          noPass = true;
        }
      ];
    };
    sudo.enable = false;
  };

  users.users.lsjostrom = {
    isNormalUser = true;
    description = "Lars Sjöström";
    extraGroups = [
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "sk-ecdsa-sha2-nistp256@openssh.com AAAAInNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb20AAAAIbmlzdHAyNTYAAABBBJ10mLOpInoqDaySyrxbzvcOrJfLw48Y6eWHa9501lw+hEEBXya3ib7nlvpCqEQJ8aPU5fVRqpkOW5zSimCiRbwAAAAEc3NoOg=="
      "sk-ecdsa-sha2-nistp256@openssh.com AAAAInNrLWVjZHNhLXNoYTItbmlzdHAyNTZAb3BlbnNzaC5jb20AAAAIbmlzdHAyNTYAAABBBLpoKvsZDIQQLfgzJhe1jAQubBNxjydkj8UfdUPaSXqgfB02OypMOC1m5ZuJYcQIxox0I+4Z8xstFhYP6s8zKZwAAAAEc3NoOg=="
    ];
  };

  nix.settings.allowed-users = [
    "@wheel"
    "root"
  ];

  nix.settings.trusted-users = [ "lsjostrom" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}

