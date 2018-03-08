for /d %%A in (7z,arj,bz2,bzip2,cab,cpio,deb,dmg,gz,gzip,hfs,iso,lha,lzh,lzma,rar,rpm,split,swm,tar,taz,tbz,tbz2,tgz,tpz,wim,xar,z,zip) do (
assoc .%%A=7-Zip.%%A
ftype 7-Zip.%%A="C:\Program Files\7-Zip\7zFM.exe" "%%1"
)
pause
