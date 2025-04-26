#!/bin/bash

# Scanner lógico Mendy
MENDY_DIR="$HOME/Mendy"
BACKUP_DIR="$MENDY_DIR/.backup"
DUPLICATES_LOG="$MENDY_DIR/.duplicates_found.txt"

echo "Iniciando verificação lógica de duplicatas..."
> "$DUPLICATES_LOG"

for file in "$MENDY_DIR"/*; do
    base_file=$(basename "$file")
        backup_file="$BACKUP_DIR/$base_file"
            if [ -f "$backup_file" ] && cmp -s "$file" "$backup_file"; then
                    echo ">> Duplicata lógica encontrada: $backup_file <-> $file" >> "$DUPLICATES_LOG"
                        fi
                        done

                        echo "Scanner concluído!"
                        echo "Verifique duplicatas em: $DUPLICATES_LOG"
                        EOF

                        # Dá permissão de execução
                        chmod +x "$LOGICAL_SCANNER"

                        # Configura autoexecução ao fechar o Termux
                        PROFILE_FILE="$HOME/.bash_logout"
                        if ! grep -q "$LOGICAL_SCANNER" "$PROFILE_FILE"; then
                            echo "" >> "$PROFILE_FILE"
                                echo "# Auto-scan Mendy ao sair" >> "$PROFILE_FILE"
                                    echo "$LOGICAL_SCANNER" >> "$PROFILE_FILE"
                                    fi

                                    echo "✅ Mendy Ninja instalado!"
                                    echo "Sempre que fechar o Termux, Mendy fará um scan lógico automático."

                                    exit 0
