#!/usr/bin/env bash
# Uruchamia trener pod http://localhost:8137 i otwiera go w Chrome (Web MIDI).
cd "$(dirname "$0")" || exit 1
PORT=8137
URL="http://localhost:$PORT"

if command -v google-chrome >/dev/null; then
  (sleep 0.7; google-chrome "$URL" >/dev/null 2>&1) &
else
  (sleep 0.7; xdg-open "$URL" >/dev/null 2>&1) &
fi

echo "Trener nut: $URL  (Ctrl+C kończy)"
exec python3 -m http.server "$PORT" --bind 127.0.0.1
