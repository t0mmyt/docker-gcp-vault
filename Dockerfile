FROM debian:buster as builder
ARG DEBIAN_FRONTEND=noninteractive
ARG VAULT_VER=1.7.3
RUN apt-get update && apt-get install -y wget unzip
RUN wget -q https://releases.hashicorp.com/vault/${VAULT_VER}/vault_${VAULT_VER}_linux_amd64.zip
RUN unzip vault_${VAULT_VER}_linux_amd64.zip

FROM alpine:latest
COPY --from=builder /vault /
COPY entrypoint.sh /entrypoint.sh
COPY vault.hcl.envsubst /etc/vault/config.hcl.envsubst
RUN chmod 755 /entrypoint.sh
RUN apk --update add --no-cache ca-certificates gettext

ENTRYPOINT /entrypoint.sh
