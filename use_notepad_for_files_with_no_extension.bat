@echo off

assoc .="No Extension"
ftype "No Extension"="notepad.exe" "%1"
assoc "No Extension"\DefaultIcon=%SystemRoot%\System32\imageres.dll,-102
