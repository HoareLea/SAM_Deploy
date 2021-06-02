
@echo off
set SAM_VER_FLAG=%appdata%\SAM\version
set SAM_TEMP_DIR=%appdata%\SAMtemp
set procName=Rhino.exe
set CURL=curl
echo Checking for latest SAM release...

set noCurl=0
WHERE %CURL%
IF %ERRORLEVEL% NEQ 0 (
  echo No CURL!
  set CURL=%~dp0curl\curl.exe
  set noCurl=1
)

if not exist %SAM_TEMP_DIR% mkdir %SAM_TEMP_DIR%

%CURL% -s https://api.github.com/repos/HoareLea/SAM_Deploy/releases/latest | %~dp0grep\grep -o -P "(?<="""tag_name""":\s""").*(?=""")" > "%SAM_TEMP_DIR%\samversion"
set /p SAM_VER_NEW=<"%SAM_TEMP_DIR%\samversion"
echo:
echo Latest SAM version is %SAM_VER_NEW%

if not exist %SAM_VER_FLAG% (
  set SAM_VER_CUR=""
) else (
  set /p SAM_VER_CUR=<%SAM_VER_FLAG%
)

if not %SAM_VER_NEW%==%SAM_VER_CUR% (

for /f "usebackq" %%A in (`tasklist /nh /fi "imagename eq %procName%"`) do (
    if %%A==%procName% (
      echo:
      echo Oh shoot! There's new version but you have %procName% open
      echo Please close %procName% and try again
      timeout 30
      goto :EOF
    )
)


 echo Installing new SAM version %SAM_VER_NEW%
 echo Downloading...


 if exist "%SAM_TEMP_DIR%\SAM.zip" (
   del "%SAM_TEMP_DIR%\SAM.zip"
   echo Existing sam.zip deleted
 )

if %noCurl%==0 (
 %CURL% --location --output "%SAM_TEMP_DIR%\SAM.zip" --url https://github.com/HoareLea/SAM_Deploy/releases/latest/download/SAM.zip
) else (
   %~dp0wget\wget.exe https://github.com/HoareLea/SAM_Deploy/releases/latest/download/SAM.zip -O "%SAM_TEMP_DIR%\SAM.zip"
)

 echo Extracting...
 %~dp07zip\7za.exe x %SAM_TEMP_DIR%\SAM.zip -bb0 -aoa -o"%SAM_TEMP_DIR%\SAM"

 echo Installing...
  
for /f "usebackq" %%A in (`tasklist /nh /fi "imagename eq %procName%"`) do (
    if %%A==%procName% (
      echo:
      echo Oh shoot! There's new version but you have %procName% open
      echo Please close %procName% and try again
      timeout 30
      goto :EOF
    )
)

 pushd "%SAM_TEMP_DIR%\SAM"
 install.bat
 popd

 echo %SAM_VER_NEW% > %SAM_VER_FLAG%
 rmdir "%SAM_TEMP_DIR%" /S /Q
 echo:
 echo Success! SAM version %SAM_VER_NEW% now installed
 timeout 60
) else (
 echo:
 echo Lucky you, installed version %SAM_VER_CUR%is up to date!
 timeout 60
)
