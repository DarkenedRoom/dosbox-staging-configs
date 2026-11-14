@echo off

:launcher
cls
ECHO [1;37m[44mษอออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ  Navy Strike: Task Force Command Launcher       บ
ECHO บ                                                 บ
ECHO ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [1] Run Navy Strike                            บ
ECHO บ  [2] Run svgaset graphics driver setup          บ
IF NOT EXIST "c:\strike\notgamed.dir" ECHO บ  [3] Fix and run svgatest graphics driver setup บ
IF EXIST "c:\strike\notgamed.dir" ECHO บ  [3] Run svgatest graphics driver setup         บ
ECHO บ  [4] Run graphics and sound setup               บ
ECHO บ  [5] View release notes                         บ
ECHO บ  [6] View free memory release notes             บ
ECHO บ  [7] Backup save                                บ
ECHO บ  [8] Restore save                               บ
ECHO บ  [R] Reset settings                             บ
ECHO บ                                                 บ
ECHO ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [9] Return to DOSBox                           บ
ECHO บ  [0] Close DOSBox                               บ
ECHO บ                                                 บ
ECHO ศอออออออออออออออออออออออออออออออออ DarkenedRoom ออผ[0m

choice /c1234567890r /s Select an option?/n 
if errorlevel 11 goto reset
if errorlevel 10 goto bye
if errorlevel 9 goto dosbox
if errorlevel 8 goto restore
if errorlevel 7 goto backup
if errorlevel 6 goto mem-notes
if errorlevel 5 goto readme
if errorlevel 4 goto setup
if errorlevel 3 goto svga-test
if errorlevel 2 goto svga-setup
if errorlevel 1 goto game

:game
@echo off
cls
cd strike
strike.exe
cd ..
goto launcher

:svga-setup
@echo off
cls
cd strike
call svgaset.exe
cd ..
goto launcher

:svga-test
@echo off
cls
cd strike
if not exist "c:\strike\notgamed.dir" if exist "d:\ns\root\notgamed.dir" copy "d:\ns\root\notgamed.dir" .
if exist "c:\strike\notgamed.dir" call svgatest.bat
pause
cd..
goto launcher

:setup
@echo off
cls
cd strike
strike.exe ?
pause
cd ..
goto launcher

:readme
@echo off
cls
cd strike
more readme.txt
pause
cd ..
goto launcher

:mem-notes
@echo off
cls
cd strike
more free_mem.txt
pause
cd ..
goto launcher

:backup
if exist "c:\strike\backup\gameconf.rr" goto backup-exist
if not exist "c:\strike\backup\gameconf.rr goto backup-yes

:backup-exist
cls
ECHO [1;37m[31mษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ Are you sure, this will replace your backup save? [Y/N] บ
ECHO ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ[0m
choice /cyn /n
if errorlevel 2 goto backup-no
if errorlevel 1 goto backup-yes

:backup-no
cls
ECHO [1;37m[31mษออออออออออออออออออป
ECHO บ Backup not saved บ
ECHO ศออออออออออออออออออผ[0m
pause
goto launcher

:backup-yes
IF NOT EXIST "c:\strike\backup" mkdir c:\strike\backup
copy "c:\strike\savegame\*.rr" "c:\strike\backup"
cls
ECHO [1;37m[32mษออออออออออออออป
ECHO บ Backup saved บ
ECHO ศออออออออออออออผ[0m
pause
goto launcher

:restore
if exist "c:\strike\backup\gameconf.rr" goto file-exist
if not exist "c:\strike\backup\gameconf.rr" goto no-file

:file-exist
cls
ECHO [1;37m[31mษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ Are you sure, this will replace yoor current backup? [Y/N] บ
ECHO ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ[0m
choice /cyn /n
if errorlevel 2 goto restore-no
if errorlevel 1 goto restore-yes

:restore-no
cls
ECHO [1;37m[31mษอออออออออออออออออออออป
ECHO บ Backup not restored บ
ECHO ศอออออออออออออออออออออผ[0m
pause
goto launcher

:restore-yes
copy "c:\strike\backup\*.rr" "c:\strike\savegame"
cls
ECHO [1;37m[32mษอออออออออออออออออป
ECHO บ Backup restored บ
ECHO ศอออออออออออออออออผ[0m
pause
goto launcher

:no-file
cls
ECHO [1;37m[32mษอออออออออออออออออออออออออออออออออออออออออป
ECHO บ There is no backup yet, make one first! บ
ECHO ศอออออออออออออออออออออออออออออออออออออออออผ[0m
pause
goto launcher

:reset
cls
ECHO [1;37m[31mษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ Are you sure, this will clear all the saved settings? [Y/N] บ
ECHO ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ[0m
choice /cyn /n
if errorlevel 2 goto reset-no
if errorlevel 1 goto reset-yes

:reset-no
cls
ECHO [1;37m[32mษออออออออออออออออออออป
ECHO บ Settings unchanged บ
ECHO ศออออออออออออออออออออผ[0m
pause
goto launcher

:reset-yes
cd strike\savegame
call restart.bat
cd \
cls
ECHO [1;37m[31mษออออออออออออออออป
ECHO บ Settings reset บ
ECHO ศออออออออออออออออผ[0m
pause
goto launcher

:bye
@echo off
exit

:dosbox
@echo off
c:
cd c:\
@echo on