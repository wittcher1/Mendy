#!/bin/bash

# Alopush - Script para automatizar Git Add, Commit e Push

echo "[+] Iniciando Alopush..."

# Adicionar todos os arquivos alterados ou novos
git add .

# Verificar se há algo para commitar
if git diff --cached --quiet; then
  echo "[!] Nenhuma alteração detectada. Nada para enviar."
    exit 0
    fi

    # Criar mensagem de commit automática com data e hora
    COMMIT_MSG="Alopush: atualização $(date '+%Y-%m-%d %H:%M:%S')"

    # Fazer o commit
    git commit -m "$COMMIT_MSG"

    # Fazer o push
    git push -u origin main

    echo "[+] Alopush concluído com sucesso!"
