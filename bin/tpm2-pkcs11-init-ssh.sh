#!/bin/bash
set -e

store=$1
if  [ -z "$store" ]; then
  echo "Usage: $0 [store-name]"
  exit 1
fi

export TPM2_PKCS11_STORE=$HOME/.local/share/tpm2-pkcs11/${store}

echo "=> Initializing store ${TPM2_PKCS11_STORE}"
mkdir -p $TPM2_PKCS11_STORE
tpm2_ptool init
tpm2_ptool addtoken --pid=1 --label=ssh --sopin="$(systemd-ask-password SOPIN)" --userpin="$(systemd-ask-password USERPIN)"

echo
echo "=> Adding SSH key"
tpm2_ptool addkey --label=ssh --algorithm=ecc256 --userpin="$(systemd-ask-password USERPIN)"

echo
echo "Store path: $TPM2_PKCS11_STORE"
echo "SSH public key:"
ssh-keygen -D /usr/lib/pkcs11/libtpm2_pkcs11.so 2>>/dev/null
