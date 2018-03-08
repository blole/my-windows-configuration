@echo off

echo Adding custom %%PATH%% entries

set errorhandler=^(pause ^&^& exit /B %errorlevel%^)

set CYGWIN=C:\Program Files\Cygwin_64_bit\bin
set GIT=C:\Program Files (x86)\Git\cmd
set JAVA=C:\Program Files\Java\jdk1.8.0_121

setx PATH "%CYGWIN%;%GIT%;%JAVA%\bin;%PATH%" /m || %errorhandler%
setx JAVA_HOME "%JAVA%" /m || %errorhandler%
