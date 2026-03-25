#!/usr/bin/bash

OUTPUT_FILE="$1"
SINCE="1 minutes ago"
TMP_FILE=$(mktemp)

{
    echo '<html><head><meta name="robots" content="noindex"><meta http-equiv="refresh" content="60"></head><body style="font-family: monospace; white-space: pre;">'
    date
    echo ''
    docker ps --format "table {{.Names}}\t{{.Status}}"
    echo ''
    docker stats --no-stream
    echo ''
    echo "nginx   requests: $(journalctl -u nginx  --since "$SINCE" --no-pager -q 2>/dev/null | grep -ci 'GET\|POST' || true) errors: $(journalctl -u nginx  --since "$SINCE" --no-pager -q 2>/dev/null | grep -ci '\[error\]' || true)"
    echo "ngircd  requests: $(journalctl -u ngircd --since "$SINCE" --no-pager -q 2>/dev/null | grep -ci 'accepted' || true) errors: $(journalctl -u ngircd --since "$SINCE" --no-pager -q 2>/dev/null | grep -ci 'error' || true)"
    echo "thelounge errors: $(journalctl -u thelounge --since "$SINCE" --no-pager -q 2>/dev/null | grep -ci 'error' || true)"
    echo '</body></html>'
} > "$TMP_FILE"

chmod 644 "$TMP_FILE"
mv "$TMP_FILE" "$OUTPUT_FILE"