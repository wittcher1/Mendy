#!/bin/bash

# Nome do diretório de backup
BACKUP_DIR="$HOME/Mendy_backup"

echo "[+] Mendy AutoPush iniciado..."

# 1. Criar backup se não existir
if [ ! -d "$BACKUP_DIR" ]; then
  echo "[+] Criando diretório de backup em: $BACKUP_DIR"
    mkdir "$BACKUP_DIR"
    fi

    # 2. Copiar tudo da Mendy para backup, exceto pastas do Git
    echo "[+] Fazendo backup dos arquivos..."
    rsync -av --exclude='.git' --exclude='node_modules' "$HOME/Mendy/" "$BACKUP_DIR/"

    # 3. Sincronizar com repositório remoto
    echo "[+] Sincronizando com o repositório remoto..."
    git pull origin main --rebase

    # 4. Adicionar alterações
    echo "[+] Adicionando alterações..."
    git add .

    # 5. Verificar se há mudanças
    if git diff --cached --quiet; then
      echo "[!] Nenhuma alteração detectada. Nada para enviar."
        exit 0
        fi

        # 6. Commit automático com data/hora
        COMMIT_MSG="Mendy AutoPush: atualização $(date '+%Y-%m-%d %H:%M:%S')"
        echo "[+] Commitando alterações..."
        git commit -m "$COMMIT_MSG"

        # 7. Push para GitHub
        echo "[+] Enviando para GitHub..."
        git push -u origin main

        echo "[+] Mendy AutoPush concluído com sucesso!"
        echo "[+] Backup atualizado em: $BACKUP_DIR"
