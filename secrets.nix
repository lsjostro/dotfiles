let
  hosts = {
    dele = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGPBpVZQTtrQBkhQKCh7GgpVrVgqdcqNGPKczcPiqr/x";
    nemo = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPRXR6s+TbdGbr5fNHzDJZT2fO3PuJ8H84tBeiIZsaTe";
  };

  commonKeys = [
  ];

  secrets = {
    "codestral_api_key" = [
      hosts.nemo
      hosts.dele
    ];
  };
in

builtins.listToAttrs (
  map (secretName: {
    name = "secrets/${secretName}.age";
    value.publicKeys = secrets."${secretName}" ++ commonKeys;
  }) (builtins.attrNames secrets)
)
