@echo off

set source="D:\Mitulka\www\pyatok-net\pyatok-net-src"
set destination="D:\OneDrive"
set dd=%DATE:~0,2%
set mm=%DATE:~3,2%
set yyyy=%DATE:~6,4%
set hour=%TIME:~0,2%
set minute=%TIME:~3,2%
set second=%TIME:~6,2%
set curdate=%yyyy%-%mm%-%dd%-%hour%-%minute%-%second%

"C:\Program Files\7-Zip\7z.exe" a -tzip -ssw -mx1 -r0 %destination%\pyatok-net-backup-%curdate%.zip %source%