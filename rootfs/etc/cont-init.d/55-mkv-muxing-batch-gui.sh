#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

CONFIG_DIR="/config/.local/share/MKV Muxing Batch GUI"

mkdir -p "$CONFIG_DIR"

# Install default config if needed.
[ -f "$CONFIG_DIR"/setting.json ] || cp -v /defaults/setting.json "$CONFIG_DIR"


if is-bool-val-true "${DARK_MODE:-0}"
then
    jq -c -M '.Dark_Mode = true' "$CONFIG_DIR"/setting.json | sponge "$CONFIG_DIR"/setting.json
else
    jq -c -M '.Dark_Mode = false' "$CONFIG_DIR"/setting.json | sponge "$CONFIG_DIR"/setting.json
fi

# vim:ts=4:sw=4:et:sts=4
