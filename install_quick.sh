#!/bin/bash
echo "=== Z Manager - Instalação Rápida ==="

if [ "$EUID" -ne 0 ]; then
    echo "Por favor, execute como root:"
    echo "sudo bash $0"
    exit 1
fi

echo "Verificando instalador..."
if [ ! -f "zmanager_installer.tar.gz" ]; then
    echo "❌ Arquivo zmanager_installer.tar.gz não encontrado"
    echo "💡 Certifique-se de que o arquivo está no mesmo diretório"
    exit 1
fi

echo "Extraindo..."
tar -xzf zmanager_installer.tar.gz

echo "Instalando..."
cd zmanager_installer
bash install.sh

echo "✅ Instalação concluída!"
