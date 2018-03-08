#!/usr/bin/env powershell

Get-ScheduledTask | ? {$_.Settings.WakeToRun -eq $true -and $_.State -ne "Disabled"} | % {$_.Settings.WakeToRun = $false; Set-ScheduledTask $_}
