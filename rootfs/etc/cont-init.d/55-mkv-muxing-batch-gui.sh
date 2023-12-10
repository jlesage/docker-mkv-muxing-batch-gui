#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

mkdir -p /config/.local/share/"MKV Muxing Batch GUI"

# Install default config if needed.
[ -f /config/.local/share/"MKV Muxing Batch GUI"/setting.json ] || cp -v /defaults/setting.json /config/.local/share/"MKV Muxing Batch GUI"/

# vim:ts=4:sw=4:et:sts=4
