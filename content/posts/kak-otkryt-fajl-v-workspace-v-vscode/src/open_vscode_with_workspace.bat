@echo off

:: Проверка прав администратора (если нужно)
:: net session >nul 2>&1
:: if %errorlevel% neq 0 (
::    echo Запрашиваю права администратора...
::    powershell -Command "Start-Process '%~f0' -ArgumentList '\"%~1\"' -Verb RunAs"
::    exit /b
:: )

:: Получаем полный путь к файлу
set "file=%~1"
for %%F in ("%file%") do set "folder=%%~dpF"
set "folder=%folder:~0,-1%"

:: Фиксированный список рабочих пространств
set "ws1=D:\Mitulka\www\gorshochek-by\gorshochek-by-src\gorshochek-by-src.code-workspace"
set "ws1_root=D:\Mitulka\www\gorshochek-by\gorshochek-by-src"
set "ws2=c:\xampp\htdocs\php-developer-base\php-developer-base.code-workspace"
set "ws2_root=C:\xampp\htdocs"
set "ws3=c:\hugo\lyasneby\lyasneby.code-workspace"
set "ws3_root=C:\hugo\lyasneby"
set "ws1=D:\Mitulka\www\pyatok-net\pyatok-net-src\pyatok-net-src.code-workspace"
set "ws1_root=D:\Mitulka\www\pyatok-net\pyatok-net-src"

:: Проверяем, относится ли папка к ws1
echo %folder%| findstr /c:"%ws1_root%" >nul
if %errorlevel% equ 0 (
    set "workspace=%ws1%"
    goto :run_vscode
)

:: Проверяем, относится ли папка к ws2
echo %folder%| findstr /c:"%ws2_root%" >nul
if %errorlevel% equ 0 (
    set "workspace=%ws2%"
    goto :run_vscode
)

:: Проверяем, относится ли папка к ws3
echo %folder%| findstr /c:"%ws3_root%" >nul
if %errorlevel% equ 0 (
    set "workspace=%ws3%"
    goto :run_vscode
)

:: Fallback: открываем папку
echo No workspace matched, opening folder instead
set "workspace=%folder%"

:run_vscode
echo File: "%file%"
echo Workspace or Folder: "%workspace%"
start "" "c:\Program Files\Microsoft VS Code\Code.exe" -r "%workspace%" "%file%"
exit
::pause