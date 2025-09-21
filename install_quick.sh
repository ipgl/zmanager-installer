#!/bin/bash
# Z Manager Quick Installer

echo "=== Z Manager - Instalação Rápida ==="

if [ "$EUID" -ne 0 ]; then
    echo "Por favor, execute como root:"
    echo "sudo bash $0"
    exit 1
fi

echo "Extraindo instalador..."
if [ ! -f "zmanager_installer.tar.gz" ]; then
    echo "Erro: arquivo zmanager_installer.tar.gz não encontrado!"
    exit 1
fi

tar -xzf zmanager_installer.tar.gz
cd zmanager_installer
bash install.sh