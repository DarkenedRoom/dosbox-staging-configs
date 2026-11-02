@echo off

:launcher
cls
ECHO [1;37m[44mษออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ LHX: Attack Chopper Launcher                     บ
ECHO บ                                                  บ
ECHO ฬออออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [1] Run LHX: Attack Chopper                     บ
ECHO บ  [2] Run Joystick Tuner                          บ
ECHO บ  [3] View release notes                          บ
ECHO บ                                                  บ
ECHO ฬออออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [4] Backup pilot                                บ
ECHO บ  [5] Restore pilot                               บ
ECHO บ                                                  บ
ECHO ฬออออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [6] Return to DOSBox                            บ
ECHO บ  [7] Close DOSBox                                บ
ECHO บ                                                  บ
ECHO ศออออออออออออออออออออออออออออออออออ DarkenedRoom ออผ[0m

choice /c1234567 /s Please select an option /n 
if errorlevel 7 goto bye
if errorlevel 6 goto dosbox
if errorlevel 5 goto restore
if errorlevel 4 goto backup
if errorlevel 3 goto readme
if errorlevel 2 goto tuner
if errorlevel 1 goto game

:game
cls
c:
cd \lhx
if exist "start.bat" call start.bat
if not exist "start.bat" lhx.exe vga joystick high ablibsound
cd \
goto launcher

:tuner
cls
c:
cd \lhx
jtuner.exe
cd \
goto launcher

:readme
cls
c:
cd \lhx
if exist "readme" more readme
if exist "readme.txt" more readme.txt
pause
cd \
goto launcher

:backup
if exist "c:\lhx\backup\lhx.cfg" goto backupexist
if not exist "c:\lhx\backup\lhx.cfg" goto backupyes

:backupexist
cls
ECHO [1;37m[31mษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ Are you sure, this will replace your backup pilot? [Y/N] บ
ECHO ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ[0m
choice /cyn /n
if errorlevel 2 goto backupno
if errorlevel 1 goto backupyes

:backupno
cls
ECHO [1;37m[31mษอออออออออออออออออป
ECHO บ Pilot not saved บ
ECHO ศอออออออออออออออออผ[0m
pause
goto launcher

:backupyes
IF NOT EXIST "c:\lhx\backup" mkdir c:\lhx\backup
copy "c:\lhx\lhx.cfg" "c:\lhx\backup"
cls
ECHO [1;37m[32mษอออออออออออออป
ECHO บ Pilot saved บ
ECHO ศอออออออออออออผ[0m
pause
goto launcher

:restore
if exist "c:\lhx\backup\lhx.cfg" goto filexist
if not exist "c:\lhx\backup\lhx.cfg" goto nofile

:filexist
cls
ECHO [1;37m[31mษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ Are you sure, this will replace yoor current pilot? [Y/N] บ
ECHO ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ[0m
choice /cyn /n
if errorlevel 2 goto restoreno
if errorlevel 1 goto restoreyes

:restoreno
cls
ECHO [1;37m[31mษออออออออออออออออออออป
ECHO บ Pilot not restored บ
ECHO ศออออออออออออออออออออผ[0m
pause
goto launcher

:restoreyes
copy "c:\lhx\backup\lhx.cfg" "c:\lhx"
cls
ECHO [1;37m[32mษออออออออออออออออป
ECHO บ Pilot restored บ
ECHO ศออออออออออออออออผ[0m
pause
goto launcher

:nofile
cls
ECHO [1;37m[32mษอออออออออออออออออออออออออออออออออออออออออป
ECHO บ There is no backup yet, make one first! บ
ECHO ศอออออออออออออออออออออออออออออออออออออออออผ[0m
pause
goto launcher

:bye
@echo off
exit

:dosbox
@echo off
c:
cd \
@echo on