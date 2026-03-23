#!/usr/bin/bash

OUTPUT_FILE="$1"
SINCE="1 minutes ago"

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
    echo "dhtnode requests: $(journalctl -u dhtnode --since "$SINCE" --no-pager -q 2>/dev/null | grep -ci 'sending' || true) errors: $(journalctl -u dhtnode --since "$SINCE" --no-pager -q 2>/dev/null | grep -ci "can't send" || true)"
    echo "coturn  requests: $(journalctl -u coturn --since "$SINCE" --no-pager -q 2>/dev/null | grep -ci 'incoming' || true) errors: $(journalctl -u coturn --since "$SINCE" --no-pager -q 2>/dev/null | grep -ci 'error' || true)"

    echo '</body></html>'
} > "$OUTPUT_FILE"

chmod 644 "$OUTPUT_FILE"