#!/bin/bash

# Alopush Turbo - Sincronizar e enviar mudanças

echo "[+] Iniciando Alopush Turbo..."

# Sincronizar primeiro
echo "[+] Sincronizando com o repositório remoto..."
git pull origin main --rebase

# Adicionar todos os arquivos alterados ou novos
git add .

# Verificar se há algo para commitar
if git diff --cached --quiet; then
  echo "[!] Nenhuma alteração detectada. Nada para enviar."
    exit 0
    fi

    # Criar mensagem de commit automática com data e hora
    COMMIT_MSG="Alopush Turbo: atualização $(date '+%Y-%m-%d %H:%M:%S')"

    # Fazer o commit
    git commit -m "$COMMIT_MSG"

    # Fazer o push
    git push -u origin main

    echo "[+] Alopush Turbo concluído com sucesso!"
