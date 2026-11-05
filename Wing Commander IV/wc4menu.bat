@echo off

:launcher
cls
ECHO [1;37m[44mษออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ Wing Commander IV: The Price of Freedom Launcher บ
ECHO บ                                                  บ
ECHO ฬออออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [1] Run Wing Commander IV                       บ
ECHO บ  [2] Configure Wing Commander IV                 บ
ECHO บ  [3] View release notes                          บ
ECHO บ                                                  บ
ECHO ฬออออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [4] Return to DOSBox                            บ
ECHO บ  [5] Close DOSBox                                บ
ECHO บ                                                  บ
ECHO ศออออออออออออออออออออออออออออออออออ DarkenedRoom ออผ[0m

choice /c12345 /s Please select an option /n 
if errorlevel 5 goto bye
if errorlevel 4 goto dosbox
if errorlevel 3 goto readme
if errorlevel 2 goto setup
if errorlevel 1 goto game

:game
cls
c:
cd \wc4
wc4.exe
pause
cd \
goto launcher

:setup
cls
c:
cd \wc4
wc4.exe -i
cd \
goto launcher

:readme
cls
c:
cd \wc4
more readme.txt
pause
cd \
goto launcher

:bye
@echo off
exit

:dosbox
@echo off
c:
cd \
@echo on