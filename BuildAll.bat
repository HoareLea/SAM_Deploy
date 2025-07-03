@echo off


set nugetexe=%~dp0nuget.exe
::set msbuildexe=C:\Program Files\Microsoft Visual Studio\2022\Professional\MSBuild\Current\Bin\msbuild
::set msbuildexe=C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\msbuild
::set msbuildexe=C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe
set msbuildexe=C:\Program Files\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin\msbuild
set STARTTIME=%TIME%

set CURLexe=curl

:: %CURLexe% --location --output nuget.exe --url https://dist.nuget.org/win-x86-commandline/latest/nuget.exe

:: only run if pull argument is provided
if "%1"=="pull" (
  echo 1.Pulling all repo
  for /d %%i in (SAM*) do (
    pushd %%i
    echo Pulling %%i
    git pull
    :: "%nugetexe%" restore
    popd
  )
)

::pause
::echo 2.Restoring BuildAlls.csproj
::"%msbuildexe%" -t:Restore BuildAlls.csproj
::pause
::echo 3.Cleaning all SAM Solutions (older versions)
::"%msbuildexe%" -t:Clean BuildAlls.csproj
::pause
::echo 4.Building all SAM Solutions
::"%msbuildexe%" -t:Rebuild BuildAlls.csproj
::pause


:: Unified restore + clean + rebuild
echo Running full RestoreCleanRebuild sequence for all SAM solutions
"%msbuildexe%" BuildAll_Release.csproj /t:RestoreCleanRebuild


set ENDTIME=%TIME%

echo Start Time: %STARTTIME%
echo End Time:   %ENDTIME%
powershell -Command "$s='%STARTTIME%'; $e='%ENDTIME%'; $st=[datetime]::Parse($s); $et=[datetime]::Parse($e); $dur=$et-$st; Write-Host Duration: $dur"

::pause




