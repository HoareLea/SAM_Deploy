@echo off

set nugetexe=%~dp0nuget.exe
set msbuildexe=C:\Program Files (x86)\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin\msbuild
set CURLexe=curl

:: %CURLexe% --location --output nuget.exe --url https://dist.nuget.org/win-x86-commandline/latest/nuget.exe


for /d %%i in (SAM*) do (
  pushd %%i
  echo Pulling %%i
  git pull
  :: "%nugetexe%" restore
  popd
)

echo Building all SAM Solutions
"%msbuildexe%" -t:Restore;Rebuild BuildAll_Debug.csproj

"%msbuildexe%" -t:Restore;Rebuild BuildAll_Debug_net.csproj

