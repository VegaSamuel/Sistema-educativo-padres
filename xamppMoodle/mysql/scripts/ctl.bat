@echo off
rem START or STOP Services
rem ----------------------------------
rem Check if argument is STOP or START

if not ""%1"" == ""START"" goto stop


"E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\mysql\bin\mysqld" --defaults-file="E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\mysql\bin\my.ini" --standalone
if errorlevel 1 goto error
goto finish

:stop
cmd.exe /C start "" /MIN call "E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\killprocess.bat" "mysqld.exe"

if not exist "E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\mysql\data\%computername%.pid" goto finish
echo Delete %computername%.pid ...
del "E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\mysql\data\%computername%.pid"
goto finish


:error
echo MySQL could not be started

:finish
exit
