@echo off

:launcher
cls
ECHO [1;37m[44mษออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ  Wing Commander I & II (W.C.A.T.) Launcher           บ
ECHO บ                                                      บ
ECHO บ  [1] Run Wing Commander W.C.A.T. launcher            บ
ECHO บ  [2] Run Wing Commander / Secret Missions 1          บ
ECHO บ  [3] Run Wing Commander: Secret Missions 2           บ
ECHO บ                                                      บ
ECHO ฬอ Wing Commander II: Vengeance of the Kilrathi อออออออน
ECHO บ  [4] Run Wing Commander II W.C.A.T launcher          บ
ECHO บ  [5] Run Wing Commander II                           บ
ECHO บ  [6] Run Wing Commander II: Special Operations 1     บ
ECHO บ  [7] Run Wing Commander II: Special Operations 2     บ
ECHO บ                                                      บ
ECHO ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [8] Return to DOSBox                                บ
ECHO บ  [9] Close DOSBox                                    บ
ECHO บ                                                      บ
ECHO ศออออออออออออออออออออออออออออออออออออออ DarkenedRoom ออผ[0m

choice /c123456789 /s Select an option? [1-9]: /n 
if errorlevel 9 goto bye
if errorlevel 8 goto dosbox
if errorlevel 7 goto wc2so2
if errorlevel 6 goto wc2so1
if errorlevel 5 goto wc2
if errorlevel 4 goto wc2wcat
if errorlevel 3 goto wc1sm2
if errorlevel 2 goto wc1
if errorlevel 1 goto wc1wcat

:wc1wcat
@echo off
cls
cd wc1
call wcat.bat
cd ..
goto launcher

:wc1
@echo off
cls
cd wc1
call wc1.bat 
cd ..
goto launcher

:wc1sm2
@echo off
cls
cd wc1
call sm2.bat 
cd ..
goto launcher

:wc2wcat
@echo off
cls
cd wc2
call wcat.bat
cd ..
goto launcher

:wc2
@echo off
cls
cd wc2
call wc2.bat
cd ..
goto launcher

:wc2so1
@echo off
cls
cd wc2
call so1.bat
cd ..
goto launcher

:wc2so2
@echo off
cls
cd wc2
call so2.bat
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
