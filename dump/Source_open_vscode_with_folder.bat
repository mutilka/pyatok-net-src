@echo off

:: Проверка прав администратора (если нужно)
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Запрашиваю права администратора...
    powershell -Command "Start-Process '%~f0' -ArgumentList '\"%~1\"' -Verb RunAs"
    exit /b
)

:: Получаем полный путь к файлу
set "file=%~1"

:: Извлекаем путь к папке
for %%F in ("%file%") do set "folder=%%~dpF"

:: Отладка: выводим пути в консоль
:: echo File: "%file%"
:: echo Folder: "%folder%"

:: Запускаем VS Code асинхронно и закрываем терминал
start "" "C:\Program Files\Microsoft VS Code\Code.exe" -r "%file%" "%folder%"

:: start "" "C:\Program Files\Microsoft VS Code\Code.exe" -r --trace-deprecation --force-node-api-uncaught-exceptions-policy=true "%file%" "%folder%"

:: Используем паузу для отладки
:: pause

exit