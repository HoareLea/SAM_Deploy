@echo off
set msbuildexe=C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin\msbuild

echo Building all SAM Solutions
"%msbuildexe%" -t:Restore;Rebuild BuildAll_Release.csproj

