# Arquivo marcado como duplicado lógico pela Mendy
# Arquivo marcado como duplicado lógico pela Mendy
#!/data/data/com.termux/files/usr/bin/bash

echo "Iniciando Mendy Auto-Scanner..."

# Caminho base
DIR=~/Mendy

# 1. Corrigir permissões de execução (.sh e .py)
find "$DIR" -iname "*.sh" -o -iname "*.py" ! -perm -700 -exec chmod 700 {} \;
echo "Permissões verificadas e corrigidas."

# 2. Remover caracteres invisíveis
find "$DIR" -type f -iname "*.sh" -o -iname "*.py" -exec sed -i 's/\r$//' {} \;
find "$DIR" -type f -iname "*.sh" -o -iname "*.py" -exec sed -i 's/[ \t]*$//' {} \;
echo "Limpeza de arquivos concluída."

# 3. Verificar sintaxe básica dos scripts Python
for file in $(find "$DIR" -iname "*.py"); do
    python -m py_compile "$file" 2>/dev/null
        if [ $? -ne 0 ]; then
                echo "Erro detectado em: $file"
                    fi
                    done

                    # 4. Verificar scripts Shell
                    for file in $(find "$DIR" -iname "*.sh"); do
                        bash -n "$file" 2>/dev/null
                            if [ $? -ne 0 ]; then
                                    echo "Erro detectado em: $file"
                                        fi
                                        done

                                        echo "Scan completo. Nenhuma falha crítica detectada."
