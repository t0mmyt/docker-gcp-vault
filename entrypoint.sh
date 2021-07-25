#!/bin/sh
set -euo pipefail

echo "Templating config"
envsubst </etc/vault/config.hcl.envsubst >/etc/vault/config.hcl

echo "Starting Vault"
/vault server -config /etc/vault/config.hcl
