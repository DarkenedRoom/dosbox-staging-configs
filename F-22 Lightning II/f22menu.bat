@echo off

:launcher
cls
ECHO [1;37m[44mษออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ  F-22 Lightning II Launcher                    บ
ECHO บ                                                บ
ECHO ฬออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [1] Run F-22 Lightning II                     บ
ECHO บ  [2] Run setup                                 บ
ECHO บ  [3] View release notes                        บ
ECHO บ  [4] Backup pilot                              บ
ECHO บ  [5] Restore pilot                             บ
ECHO บ                                                บ
ECHO ฬอ MIDI อออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [6] Use port device (e.g. VirtualMIDISynth)   บ
ECHO บ  [7] Use Fluidsynth                            บ
ECHO บ  [8] Use Sound Canvas                          บ
ECHO บ                                                บ
ECHO ฬออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [9] Return to DOSBox                          บ
ECHO บ  [0] Close DOSBox                              บ
ECHO บ                                                บ
ECHO ศออออออออออออออออออออออออออออออออ DarkenedRoom ออผ[0m

choice /c1234567890 /s Select an option? [1-0]: /n 
if errorlevel 10 goto bye
if errorlevel 9 goto dosbox
if errorlevel 8 goto soundcanvas
if errorlevel 7 goto fluidsynth
if errorlevel 6 goto port
if errorlevel 5 goto restore
if errorlevel 4 goto backup
if errorlevel 3 goto readme
if errorlevel 2 goto setup
if errorlevel 1 goto game

:game
@echo off
cls
cd f22
f22.exe
cd ..
goto launcher

:setup
@echo off
cls
cd f22
setup.exe
cd ..
goto launcher

:readme
@echo off
cls
cd f22
more readme.txt
pause
cd ..
goto launcher

:backup
if exist "c:\f22\backup\f22plyr.sav" goto backupexist
if not exist "c:\f22\backup\f22plyr.sav" goto backupyes

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
IF NOT EXIST "c:\f22\backup" mkdir c:\f22\backup
copy "c:\f22\f22plyr.sav" "c:\f22\backup"
cls
ECHO [1;37m[32mษอออออออออออออป
ECHO บ Pilot saved บ
ECHO ศอออออออออออออผ[0m
pause
goto launcher

:restore
if exist "c:\f22\backup\f22plyr.sav" goto filexist
if not exist "c:\f22\backup\f22plyr.sav" goto nofile

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
copy "c:\f22\backup\f22plyr.sav" "c:\f22"
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

:port
cls
mixer /listmidi
choice /c01234 /s Select a port device: /n 
if errorlevel 5 config -set midi midiconfig=4
if errorlevel 4 config -set midi midiconfig=3
if errorlevel 3 config -set midi midiconfig=2
if errorlevel 2 config -set midi midiconfig=1
if errorlevel 1 config -set midi midiconfig=0
cls
config -set midi mididevice=port
ECHO [1;37m[44mษออออออออออออออออออออออออป
ECHO บ  Port device selected  บ
ECHO ศออออออออออออออออออออออออผ[0m
pause
goto launcher

:fluidsynth
cls
config -set midi mididevice=fluidsynth
ECHO [1;37m[44mษอออออออออออออออออออออออป
ECHO บ  FluidSynth selected  บ
ECHO ศอออออออออออออออออออออออผ[0m
pause
goto launcher

:soundcanvas
cls
config -set midi mididevice=soundcanvas
ECHO [1;37m[44mษอออออออออออออออออออออออออป
ECHO บ  Sound Canvas selected  บ
ECHO ศอออออออออออออออออออออออออผ[0m
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