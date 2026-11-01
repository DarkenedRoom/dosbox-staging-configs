@echo off

:launcher
cls
ECHO [1;37m[44mษออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ  Aces Of The Pacific Launcher                  บ
ECHO บ                                                บ
ECHO ฬออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [1] Run Aces Of The Pacific                   บ
ECHO บ  [2] Run setup                                 บ
ECHO บ  [3] View release notes                        บ
ECHO บ  [4] Backup pilot careers                      บ
ECHO บ  [5] Restore pilot careers                     บ
ECHO บ  [6] Backup aces and missions                  บ
ECHO บ  [7] Restore aces and missions                 บ
ECHO บ                                                บ
ECHO ฬออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [8] Return to DOSBox                          บ
ECHO บ  [9] Close DOSBox                              บ
ECHO บ                                                บ
ECHO ศออออออออออออออออออออออออออออออออ DarkenedRoom ออผ[0m

choice /c123456789 /s Select an option? [1-9]: /n 
if errorlevel 9 goto bye
if errorlevel 8 goto dosbox
if errorlevel 7 goto restore-aces
if errorlevel 6 goto backup-aces
if errorlevel 5 goto restore-career
if errorlevel 4 goto backup-career
if errorlevel 3 goto readme
if errorlevel 2 goto setup
if errorlevel 1 goto game

:game
@echo off
cls
if exist "aotpcd.bat" call aotpcd.bat
if exist "aces.com" aces.com
goto launcher

:setup
@echo off
cls
if exist "install.bat" call install.bat
if exist "install.exe" install.exe
goto launcher

:readme
@echo off
cls
if exist "readme" more readme
pause
goto launcher

rem Backup career

:backup-career
if exist ".\backup\roster.dat" goto backup-career-exist
if not exist ".\backup\roster.dat" goto backup-career-yes

:backup-career-exist
cls
ECHO [1;37m[31mษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ Are you sure, this will replace your backup pilot? [Y/N] บ
ECHO ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ[0m
choice /cyn /n
if errorlevel 2 goto backup-career-no
if errorlevel 1 goto backup-career-yes

:backup-career-no
cls
ECHO [1;37m[31mษอออออออออออออออออป
ECHO บ Pilot not saved บ
ECHO ศอออออออออออออออออผ[0m
pause
goto launcher

:backup-career-yes
IF NOT EXIST ".\backup" mkdir backup
copy "roster.dat" ".\backup"
cls
ECHO [1;37m[32mษอออออออออออออป
ECHO บ Pilot saved บ
ECHO ศอออออออออออออผ[0m
pause
goto launcher

rem Restore career

:restore-career
if exist ".\backup\roster.dat" goto restore-career-filexist
if not exist ".\backup\roster.dat" goto restore-career-nofile

:restore-career-filexist
cls
ECHO [1;37m[31mษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ Are you sure, this will replace yoor current pilot? [Y/N] บ
ECHO ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ[0m
choice /cyn /n
if errorlevel 2 goto restore-career-no
if errorlevel 1 goto restore-career-yes

:restore-career-no
cls
ECHO [1;37m[31mษออออออออออออออออออออป
ECHO บ Pilot not restored บ
ECHO ศออออออออออออออออออออผ[0m
pause
goto launcher

:restore-career-yes
copy ".\backup\roster.dat" "."
cls
ECHO [1;37m[32mษออออออออออออออออป
ECHO บ Pilot restored บ
ECHO ศออออออออออออออออผ[0m
pause
goto launcher

:restore-career-nofile
cls
ECHO [1;37m[32mษอออออออออออออออออออออออออออออออออออออออออป
ECHO บ There is no backup yet, make one first! บ
ECHO ศอออออออออออออออออออออออออออออออออออออออออผ[0m
pause
goto launcher

rem Backup top aces and top missions

:backup-aces
if exist ".\backup\topace.dat" goto backup-aces-exist
if not exist ".\backup\topace.dat" goto backup-aces-yes

:backup-aces-exist
cls
ECHO [1;37m[31mษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ Are you sure, this will replace your top aces and missions backup? [Y/N] บ
ECHO ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ[0m
choice /cyn /n
if errorlevel 2 goto backup-aces-no
if errorlevel 1 goto backup-aces-yes

:backup-aces-no
cls
ECHO [1;37m[31mษอออออออออออออออออออออออออออออออออออออป
ECHO บ Top aces and top missions not saved บ
ECHO ศอออออออออออออออออออออออออออออออออออออผ[0m
pause
goto launcher

:backup-aces-yes
IF NOT EXIST ".\backup" mkdir backup
copy "topace.dat" ".\backup"
copy "topmiss.dat" ".\backup"
cls
ECHO [1;37m[32mษอออออออออออออออออออออออออออออออออป
ECHO บ Top aces and top missions saved บ
ECHO ศอออออออออออออออออออออออออออออออออผ[0m
pause
goto launcher

rem Restore top aces and top missions

:restore-aces
if exist ".\backup\topace.dat" goto restore-aces-filexist
if not exist ".\backup\topace.dat" goto restore-aces-nofile

:restore-aces-filexist
cls
ECHO [1;37m[31mษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ Are you sure, this will replace your top aces and missions backup? [Y/N] บ
ECHO ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ[0m
choice /cyn /n
if errorlevel 2 goto restore-aces-no
if errorlevel 1 goto restore-aces-yes

:restore-aces-no
cls
ECHO [1;37m[31mษออออออออออออออออออออออออออออออออออออออออป
ECHO บ Top aces and top missions not restored บ
ECHO ศออออออออออออออออออออออออออออออออออออออออผ[0m
pause
goto launcher

:restore-aces-yes
copy ".\backup\topace.dat" "."
copy ".\backup\topmiss.dat" "."
cls
ECHO [1;37m[32mษออออออออออออออออออออออออออออออออออออป
ECHO บ Top aces and top missions restored บ
ECHO ศออออออออออออออออออออออออออออออออออออผ[0m
pause
goto launcher

:restore-aces-nofile
cls
ECHO [1;37m[32mษอออออออออออออออออออออออออออออออออออออออออป
ECHO บ There is no backup yet, make one first! บ
ECHO ศอออออออออออออออออออออออออออออออออออออออออผ[0m
pause
goto launcher

rem quitting

:bye
@echo off
exit

:dosbox
@echo off
c:
cd c:\
@echo on