#!/data/data/com.termux/files/usr/bin/bash
# Loop infinito: roda o scanner a cada 10 minutos
while true; do
  ~/Mendy/mendy_logical_scanner.sh
  sleep 600
done
