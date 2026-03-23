@echo off
chcp 65001 >nul 2>nul
title Gerador de Provas
color 0A

echo.
echo  =====================================================
echo    GERADOR DE PROVAS  -  Iniciando servidor...
echo  =====================================================
echo.

:: ── Verifica Python ──────────────────────────────────
python --version >nul 2>&1
if errorlevel 1 (
    color 0C
    echo  [ERRO] Python nao encontrado!
    echo.
    echo  Solucao:
    echo    1. Acesse: https://www.python.org/downloads/
    echo    2. Baixe Python 3.10 ou superior
    echo    3. NA INSTALACAO: marque "Add Python to PATH"
    echo    4. Reinicie e tente novamente
    echo.
    pause
    exit /b 1
)

echo  Python encontrado:
python --version
echo.

:: ── Instala dependencias ──────────────────────────────
echo  Instalando/verificando dependencias...
echo  (Aguarde, pode demorar na primeira vez)
echo.

python -m pip install flask python-docx --quiet 2>&1
if errorlevel 1 (
    echo  Tentando com --user...
    python -m pip install flask python-docx --quiet --user 2>&1
)

echo  Dependencias OK.
echo.

:: ── Inicia o servidor ─────────────────────────────────
echo  =====================================================
echo    Acesse no navegador: http://localhost:5000
echo    Para encerrar: pressione Ctrl+C ou feche a janela
echo  =====================================================
echo.

cd /d "%~dp0"
python servidor.py

echo.
echo  Servidor encerrado.
pause
