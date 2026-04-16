{
  config,
  pkgs,
  ...
}:
let
  passage-wrapped = pkgs.writeShellScriptBin "passage" ''
    get_tpm_pin() {
      local key_id
      if key_id=$(${pkgs.keyutils}/bin/keyctl request user age-tpm-pin @u 2>/dev/null); then
        ${pkgs.keyutils}/bin/keyctl pipe "$key_id"
      else
        local pin
        pin=$(${pkgs.systemd}/bin/systemd-ask-password "TPM PIN:") || return 1
        key_id=$(echo -n "$pin" | ${pkgs.keyutils}/bin/keyctl padd user age-tpm-pin @u)
        ${pkgs.keyutils}/bin/keyctl timeout "$key_id" 28800
        echo -n "$pin"
      fi
    }

    export AGE_TPM_PIN
    AGE_TPM_PIN=$(get_tpm_pin) || { echo "Failed to obtain TPM PIN" >&2; exit 1; }

    exec ${pkgs.passage}/bin/passage "$@"
  '';

  pass-compat = pkgs.runCommand "pass-compat" { } ''
    mkdir -p $out/bin
    ln -s ${passage-wrapped}/bin/passage $out/bin/pass
  '';
in
{
  home.packages = with pkgs; [
    age-plugin-fido2-hmac
    age-plugin-tpm
    passage-wrapped
    pass-compat
    rage
  ];

  age = {
    identityPaths = [
      "${config.home.homeDirectory}/.age/id-dotfiles"
    ];

  };
}
