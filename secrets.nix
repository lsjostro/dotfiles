let
  commonKeys = [
    "age1yf924wu95yz2rqrl7pfwsudvtpsgzlkdey85kd9uk8hzwyjq33xq88u4hc" # solokey
  ];

  hosts = {
    nemo = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPRXR6s+TbdGbr5fNHzDJZT2fO3PuJ8H84tBeiIZsaTe";
  };

  secrets = {
    "codestral_api_key" = [
      hosts.nemo
    ];
  };
in

builtins.listToAttrs (
  map (secretName: {
    name = "secrets/${secretName}.age";
    value.publicKeys = secrets."${secretName}" ++ commonKeys;
  }) (builtins.attrNames secrets)
)
