@echo off

:launcher
cls
ECHO [1;37m[44mษอออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ  Pacific Strike Launcher                        บ
ECHO บ                                                 บ
ECHO ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [1] Run Pacific Strike                         บ
ECHO บ  [2] Run setup                                  บ
ECHO บ  [3] View release notes                         บ
ECHO บ  [4] Backup saves                               บ
ECHO บ  [5] Restore saves                              บ
ECHO บ                                                 บ
ECHO ฬอ MIDI ออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [M] Use Roland MT-32                           บ
ECHO บ  [S] Use Sound Canvas                           บ
ECHO บ  [F] Use Fluidsynth                             บ
ECHO บ  [P] Use port device (e.g. VirtualMIDISynth)    บ
ECHO บ                                                 บ
ECHO ฬอออออออออออออออออออออออออออออออออออออออออออออออออน
ECHO บ  [9] Return to DOSBox                           บ
ECHO บ  [0] Close DOSBox                               บ
ECHO บ                                                 บ
ECHO ศอออออออออออออออออออออออออออออออออ DarkenedRoom ออผ[0m

choice /c12345mfsp90 /s Select an option?/n 

if errorlevel 11 goto bye
if errorlevel 10 goto dosbox
if errorlevel 9 goto port
if errorlevel 8 goto fluidsynth
if errorlevel 7 goto soundcanvas
if errorlevel 6 goto mt32
if errorlevel 5 goto restore
if errorlevel 4 goto backup
if errorlevel 3 goto readme
if errorlevel 2 goto setup
if errorlevel 1 goto game

:game
@echo off
cls
cd ps
pacific.exe
pause
cd ..
goto launcher

:setup
@echo off
cls
cd ps
install.exe
cd ..
goto launcher

:readme
@echo off
cls
cd ps
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
ECHO [1;37m[31mษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
ECHO บ Are you sure, this will replace your backup savea? [Y/N] บ
ECHO ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ[0m
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
IF NOT EXIST "c:\ps\backup" mkdir c:\ps\backup
copy "c:\ps\*.sav" "c:\ps\backup"
cls
ECHO [1;37m[32mษออออออออออออออป
ECHO บ Backup saved บ
ECHO ศออออออออออออออผ[0m
pause
goto launcher

:restore
if exist "c:\ps\backup\*.sav" goto file-exist
if not exist "c:\ps\backup\*.sav" goto no-file

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
copy "c:\ps\backup\*.sav" "c:\ps"
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

:mt32
cls
config -set midi mididevice=mt32
ECHO [1;37m[44mษอออออออออออออออออออออออออป
ECHO บ  Roland MT-32 selected  บ
ECHO ศอออออออออออออออออออออออออผ[0m
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

:fluidsynth
cls
config -set midi mididevice=fluidsynth
ECHO [1;37m[44mษอออออออออออออออออออออออป
ECHO บ  FluidSynth selected  บ
ECHO ศอออออออออออออออออออออออผ[0m
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

:bye
@echo off
exit

:dosbox
@echo off
c:
cd c:\
@echo on