#!/bin/sh
# Dvojklik: otvorí okno „DJI SDR“ s obrazom (najnižšie oneskorenie) a spustí čítanie z prijímača.
# V OBS pridaj zdroj „Zachytávanie okna“ → okno „DJI SDR …“ (môže byť schované za OBS, nie minimalizované).
# UDP výstup pre Media Source (udp://127.0.0.1:5000) beží súčasne.
cd "$(dirname "$0")"
# FPS musí sedieť s tým, čo ukazuje prijímač (napr. 1080p50 → 50, Low Latency → 60)
FPS=50
./dji-okno &
OKNO=$!
trap 'kill $OKNO 2>/dev/null' EXIT
echo "Zadaj heslo do Macu (potrebné na prevzatie USB zariadenia):"
sudo ./dji2obs -f $FPS "$@"
