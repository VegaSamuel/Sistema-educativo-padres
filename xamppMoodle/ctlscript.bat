@echo off
rem START or STOP Services
rem ----------------------------------
rem Check if argument is STOP or START

if not ""%1"" == ""START"" goto stop

if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\hypersonic\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\server\hsql-sample-database\scripts\ctl.bat START)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\ingres\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\ingres\scripts\ctl.bat START)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\mysql\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\mysql\scripts\ctl.bat START)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\postgresql\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\postgresql\scripts\ctl.bat START)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\apache\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\apache\scripts\ctl.bat START)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\openoffice\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\openoffice\scripts\ctl.bat START)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\apache-tomcat\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\apache-tomcat\scripts\ctl.bat START)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\resin\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\resin\scripts\ctl.bat START)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\jetty\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\jetty\scripts\ctl.bat START)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\subversion\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\subversion\scripts\ctl.bat START)
rem RUBY_APPLICATION_START
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\lucene\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\lucene\scripts\ctl.bat START)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\third_application\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\third_application\scripts\ctl.bat START)
goto end

:stop
echo "Stopping services ..."
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\third_application\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\third_application\scripts\ctl.bat STOP)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\lucene\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\lucene\scripts\ctl.bat STOP)
rem RUBY_APPLICATION_STOP
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\subversion\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\subversion\scripts\ctl.bat STOP)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\jetty\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\jetty\scripts\ctl.bat STOP)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\hypersonic\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\server\hsql-sample-database\scripts\ctl.bat STOP)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\resin\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\resin\scripts\ctl.bat STOP)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\apache-tomcat\scripts\ctl.bat (start /MIN /B /WAIT E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\apache-tomcat\scripts\ctl.bat STOP)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\openoffice\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\openoffice\scripts\ctl.bat STOP)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\apache\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\apache\scripts\ctl.bat STOP)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\ingres\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\ingres\scripts\ctl.bat STOP)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\mysql\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\mysql\scripts\ctl.bat STOP)
if exist E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\postgresql\scripts\ctl.bat (start /MIN /B E:\Android Git\sistema_educativo_padres\Sistema-educativo-padres\xamppMoodle\postgresql\scripts\ctl.bat STOP)

:end

