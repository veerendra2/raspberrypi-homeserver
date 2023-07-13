#!/usr/bin/env bash

export DATABASE_URL=postgresql://$(cat ${VAULTWARDEN_POSTGRES_USER_FILE}):$(cat ${VAULTWARDEN_POSTGRES_PASSWORD_FILE})@${VAULTWARDEN_POSTGRES_HOST}/vaultwarden
#export SMTP_PASSWORD=$(cat /run/secrets/vaultwarden_smtp_password)
