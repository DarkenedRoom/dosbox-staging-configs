@echo off

:launcher
cls
ECHO [1;37m[44mÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
ECHO º  Wing Commander I & II (W.C.A.T.) Launcher          º
ECHO º                                                     º
ECHO ÌÍ Wing Commander ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
ECHO º  [1] Run Wing Commander W.C.A.T. launcher           º
ECHO º  [2] Run Wing Commander / Secret Missions 1         º
ECHO º  [3] Run Wing Commander: Secret Missions 2          º
ECHO º                                                     º
ECHO ÌÍ Wing Commander II: Vengeance of the Kilrathi ÍÍÍÍÍÍ¹
ECHO º  [4] Run Wing Commander II W.C.A.T launcher         º
ECHO º  [5] Run Wing Commander II                          º
ECHO º  [6] Run Wing Commander II: Special Operations 1    º
ECHO º  [7] Run Wing Commander II: Special Operations 2    º
ECHO º                                                     º
ECHO ÌÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹
ECHO º  [8] Return to DOSBox                               º
ECHO º  [9] Close DOSBox                                   º
ECHO º                                                     º
ECHO ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ DarkenedRoom ÍÍ¼[0m

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
