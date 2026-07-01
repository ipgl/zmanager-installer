#!/bin/bash
# Z Manager Quick Installer

echo "=== Z Manager - Instalação Rápida ==="

if [ "$EUID" -ne 0 ]; then
    echo "Por favor, execute como root:"
    echo "sudo bash $0"
    exit 1
fi

echo "Baixando instalador..."
if command -v curl >/dev/null 2>&1; then
    curl -sL -o zmanager_installer.tar.gz https://raw.githubusercontent.com/ipgl/zmanager-installer/V1.0/zmanager_installer.tar.gz
elif command -v wget >/dev/null 2>&1; then
    wget -q -O zmanager_installer.tar.gz https://raw.githubusercontent.com/ipgl/zmanager-installer/V1.0/zmanager_installer.tar.gz
else
    echo "Erro: é necessário ter curl ou wget instalado."
    exit 1
fi

echo "Verificando download..."
if [ ! -f "zmanager_installer.tar.gz" ]; then
    echo "Erro: falha ao baixar zmanager_installer.tar.gz!"
    exit 1
fi

echo "Extraindo instalador..."
tar -xzf zmanager_installer.tar.gz

echo "Executando instalação..."
cd zmanager_installer
bash install.sh
