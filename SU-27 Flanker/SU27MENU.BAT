@echo off

:launcher
cls
ECHO [1;37m[44mษอออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ  SU-27 Flanker Launcher                         บ
ECHO บ                                                 บ
ECHO ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [1] Run SU-27 Flanker                          บ
ECHO บ  [2] Run setup                                  บ
ECHO บ  [3] View release notes                         บ
if exist "c:\su27\rmg\rmg.exe" ECHO บ  [4] Run Random Mission Generator               บ
if exist "c:\su27\rmg\rmgv150.txt" ECHO บ  [5] View RMG release notes                     บ
ECHO บ                                                 บ
ECHO ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [9] Return to DOSBox                           บ
ECHO บ  [0] Close DOSBox                               บ
ECHO บ                                                 บ
ECHO ศอออออออออออออออออออออออออออออออออ DarkenedRoom ออผ[0m

choice /c1234590 /s Select an option?/n 

if errorlevel 7 goto bye
if errorlevel 6 goto dosbox
if errorlevel 5 goto rmg-readme
if errorlevel 4 goto rmg
if errorlevel 3 goto readme
if errorlevel 2 goto setup
if errorlevel 1 goto game

:game
@echo off
cls
cd su27
su27dos.exe
cd ..
goto launcher

:setup
@echo off
cls
cd su27
setsound.exe
cd ..
goto launcher

:readme
@echo off
cls
cd su27
more readme.txt
pause
cd ..
goto launcher

:rmg
@echo off
cls
if not exist "c:\su27\rmg\rmg.exe" goto launcher
cd \su27\rmg
rmg.exe
cd ..
goto launcher

:rmg-readme
@echo off
cls
if not exist "c:\su27\rmg\rmgv150.txt" goto launcher
cd \su27\rmg
more rmgv150.txt
pause
cd ..
goto launcher

:bye
@echo off
exit

:dosbox
@echo off
c:
cd c:\
@echo on