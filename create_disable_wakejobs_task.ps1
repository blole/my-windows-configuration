#!/usr/bin/env powershell

Set-ExecutionPolicy RemoteSigned

$name = "disable wakejobs"
$desc = "http://superuser.com/questions/958109/how-to-prevent-windows-10-waking-from-sleep-when-traveling-in-bag"
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-NoProfile -WindowStyle Hidden -Command "$(pwd)\disable_wakejobs.ps1"'
$trigger = New-ScheduledTaskTrigger -Once -At 00:01 -RepetitionInterval (New-TimeSpan -Minutes 5)
$settings = New-ScheduledTaskSettingsSet -Compatibility Win8 -AllowStartIfOnBatteries -ExecutionTimeLimit 0

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $name -Settings $settings -Description $desc -User SYSTEM -Force
