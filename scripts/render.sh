#!/usr/bin/env bash
set -euo pipefail

# Load .env into environment
if [ -f .env ]; then
  set -a
  source .env
  set +a
fi

# Build overrides only for vars that exist
args=()
[ -n "${POSITION_TITLE:-}" ] && args+=(--cv.headline "$POSITION_TITLE")
[ -n "${CONTACT_LOCATION:-}" ] && args+=(--cv.location "$CONTACT_LOCATION")
[ -n "${CONTACT_EMAIL:-}" ] && args+=(--cv.email "$CONTACT_EMAIL")
[ -n "${CONTACT_PHONE:-}" ] && args+=(--cv.phone "$CONTACT_PHONE")

# TODO: Support more "environment variable" overrides

# Update current date
TODAY="$(date +%F)"
args+=(--settings.current_date "$TODAY")

# Execute rendercv command
exec rendercv render resume.yaml --watch "${args[@]}"
