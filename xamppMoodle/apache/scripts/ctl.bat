@echo off

if not ""%1"" == ""START"" goto stop

cmd.exe /C start /B /MIN "" "E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\apache\bin\httpd.exe"

if errorlevel 255 goto finish
if errorlevel 1 goto error
goto finish

:stop
cmd.exe /C start "" /MIN call "E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\killprocess.bat" "httpd.exe"

if not exist "E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\apache\logs\httpd.pid" GOTO finish
del "E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\apache\logs\httpd.pid"
goto finish

:error
echo Error starting Apache

:finish
exit
