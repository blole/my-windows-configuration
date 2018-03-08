@echo off
setlocal enableextensions

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    cd /d "%~dp0"
:--------------------------------------

set errorhandler=^(pause ^&^& exit /B %errorlevel%^)

reg import folders-in-this-pc.reg || %errorhandler%
reg import folders-in-navigation-pane.reg || %errorhandler%
reg import explorer-launchto-thispc.reg || %errorhandler%
reg import disable-thumbs.db.reg || %errorhandler%
reg import disable-sticky-keys.reg || %errorhandler%
reg import Windows_8_Zero_Startup_Delay.reg || %errorhandler%

reg import associations-bash.reg || %errorhandler%
reg import show-file-extensions.reg || %errorhandler%

reg import extend-flux-range.reg || %errorhandler%

reg import "Show Super Hidden File Extensions in Windows Explorer.reg" || %errorhandler%
reg import "Remove Search Icon from Windows 10 Taskbar.reg" || %errorhandler%
reg import "Remove Task View Icon from Windows 10 Taskbar.reg" || %errorhandler%
reg import "Remove OneDrive Icon in Windows 10's File Explorer.reg" || %errorhandler%

reg import "language.reg" || %errorhandler%
reg import "region.reg" || %errorhandler%
reg import "TakeOwnershipInstall.reg" || %errorhandler%
reg import "ShortcutTextRemove.reg" || %errorhandler%

call use_notepad_for_files_with_no_extension.bat || %errorhandler%
::call path.bat || %errorhandler%
powershell -ExecutionPolicy RemoteSigned -File create_disable_wakejobs_task.ps1 || %errorhandler%
filterkeys.exe 180 17

call restart_explorer.bat || %errorhandler%

echo Done
sleep 2