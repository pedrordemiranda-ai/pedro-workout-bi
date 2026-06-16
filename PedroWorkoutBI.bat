@echo off
title Pedro Workout BI - Servidor
echo Iniciando Pedro Workout BI...

:: Inicia o servidor Python em background
start "" "C:\Users\pedro\AppData\Local\Programs\Python\Python311\python.exe" -m http.server 3456 --directory "C:\Users\pedro\pedro-workout-bi"

:: Aguarda 2 segundos para o servidor subir
timeout /t 2 /nobreak >nul

:: Abre o browser
start "" "http://localhost:3456"

echo Servidor rodando. Feche esta janela para encerrar o servidor.
echo.
echo Para encerrar o app, feche esta janela.
pause >nul
