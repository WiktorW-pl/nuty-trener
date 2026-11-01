#!/usr/bin/env bash
# Przenosi trener na telefon przez USB, bez publikowania w internecie.
# Telefon widzi komputer jako localhost, więc MIDI, mikrofon i tryb offline działają bez https.
cd "$(dirname "$0")" || exit 1
PORT=8137

adb wait-for-device
adb reverse "tcp:$PORT" "tcp:$PORT" || exit 1

echo "Na telefonie otwórz w Chrome: http://localhost:$PORT  (Ctrl+C kończy)"
exec python3 -m http.server "$PORT" --bind 127.0.0.1
