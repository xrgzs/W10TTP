@chcp 65001 >nul
PUSHD "%~dp0"
CALL :CLEAN
del /f /q %%a W10TTP.exe
curl.exe --version || EXIT 1
if not exist PECMD.exe curl.exe -sSL https://file.uhsea.com/2404/431fea5861eab95bd1a4fca2cc2200aeEP.exe -o PECMD.exe || EXIT 1
if not exist ResHacker.exe curl.exe -sSL https://file.uhsea.com/2404/0adb663c706b62e9b3a7e5bc3a5842000C.exe -o ResHacker.exe || EXIT 1
if not exist mpress.exe curl.exe -sSL https://file.uhsea.com/2404/66cc1fad506355f08f3ff958ab178f40P6.exe -o mpress.exe || EXIT 1
PECMD.exe CMPS W10TTP.WCS W10TTP.WCZ || EXIT 1
ResHacker.exe -script ResHacker.txt || EXIT 1
ResHacker.exe -open VersionInfo.rc -save VersionInfo.res -action compile || EXIT 1
ResHacker.exe -open W10TTP.exe -save W10TTP.exe -action addoverwrite -res VersionInfo.res -mask VERSIONINFO,, || EXIT 1
ResHacker.exe -open StringTable.rc -save StringTable.res -action compile || EXIT 1
ResHacker.exe -open W10TTP.exe -save W10TTP.exe -action addoverwrite -res StringTable.res -mask STRINGTABLE,, || EXIT 1
mpress -s W10TTP.exe || EXIT 1
CALL :CLEAN
EXIT 0

:CLEAN
FOR %%a in (
ResHacker.ini
ResHacker.log
VersionInfo.res
StringTable.res
W10TTP.WCZ
) do del /f /q %%a 2>nul
GOTO :EOF
