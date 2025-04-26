#!/bin/bash

LOG_FILE="$HOME/Mendy/mendy_daemon.log"
UPDATE_INTERVAL=3600 # Tempo para buscar atualização (1 hora)
LAST_UPDATE=$(date +%s)

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Mendy Daemon iniciado." >> "$LOG_FILE"

while true; do
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Rodando Auto-Scanner..." >> "$LOG_FILE"

        # Scanner de arquivos
            find "$HOME/Mendy" -iname "*.sh" -o -iname "*.py" -o -iname "*.txt" -type f 2>/dev/null >> "$LOG_FILE"

                # Corrigir permissões
                    chmod -R 700 "$HOME/Mendy" 2>/dev/null

                        # Auto-restart em caso de erro
                            if [[ $? -ne 0 ]]; then
                                    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Erro detectado! Reiniciando o daemon..." >> "$LOG_FILE"
                                            exec "$0"
                                                fi

                                                    # Checagem de atualização a cada hora
                                                        CURRENT_TIME=$(date +%s)
                                                            if (( CURRENT_TIME - LAST_UPDATE >= UPDATE_INTERVAL )); then
                                                                    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Verificando atualizações..." >> "$LOG_FILE"

                                                                                    if [ -d "$HOME/Mendy/.git" ]; then
                                                                                                cd "$HOME/Mendy" && git pull >> "$LOG_FILE" 2>&1
                                                                                                            echo "[$(date '+%Y-%m-%d %H:%M:%S')] Atualização completa." >> "$LOG_FILE"
                                                                                                                    else
                                                                                                                                echo "[$(date '+%Y-%m-%d %H:%M:%S')] Repositório Git não encontrado. Pulando atualização." >> "$LOG_FILE"
                                                                                                                                        fi

                                                                                                                                                LAST_UPDATE=$CURRENT_TIME
                                                                                                                                                    fi

                                                                                                                                                        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Ciclo concluído." >> "$LOG_FILE"
                                                                                                                                                            sleep 60
                                                                                                                                                            done
