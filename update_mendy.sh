#!/bin/bash

# Caminho do projeto
GIT_DIR="$HOME/Mendy"
LOG_DIR="$GIT_DIR/logs"
LOG_FILE="$LOG_DIR/update_$(date '+%Y%m%d').log"

# Função para logar eventos
log_event() {
    mkdir -p "$LOG_DIR"
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
        }

        # Atualizar projeto
        if [ -d "$GIT_DIR/.git" ]; then
            cd "$GIT_DIR" || exit
                if git diff-index --quiet HEAD --; then
                        echo "Atualizando Mendy..."
                                git pull origin main >> "$LOG_FILE" 2>&1
                                        echo "Atualização concluída."
                                                log_event "Mendy atualizado com sucesso."
                                                    else
                                                            echo "Alterações locais detectadas. Atualização ignorada."
                                                                    log_event "Atualização ignorada (modificações locais)."
                                                                        fi
                                                                        else
                                                                            echo "Repositório Git não encontrado em $GIT_DIR."
                                                                                log_event "Falha na atualização: Repositório Git não encontrado."
                                                                                fi
