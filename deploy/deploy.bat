
@echo off
set SAM_VER_FLAG=%appdata%\SAM\version
set SAM_TEMP_DIR=%temp%
echo Checking for latest SAM release...


curl\curl -s https://api.github.com/repos/HoareLea/SAM_Deploy/releases/latest | grep\grep -o -P "(?<="""tag_name""":\s""").*(?=""")" > "%SAM_TEMP_DIR%\samversion"
set /p SAM_VER_NEW=<"%SAM_TEMP_DIR%\samversion"
echo Latest SAM version is %SAM_VER_NEW%

if not exist %SAM_VER_FLAG% (
  set SAM_VER_CUR=""
) else (
  set /p SAM_VER_CUR=<%SAM_VER_FLAG%
)

if not %SAM_VER_NEW%==%SAM_VER_CUR% (
 echo Yay! Installing new SAM version %SAM_VER_NEW%
 echo Downloading...
 wget\wget.exe -N https://github.com/HoareLea/SAM_Deploy/releases/latest/download/SAM.zip -O "%SAM_TEMP_DIR%\SAM.zip"
 echo Extracting...
 7zip\7za.exe x %SAM_TEMP_DIR%\SAM.zip -bb0 -aoa -o"%SAM_TEMP_DIR%\SAM"
 pushd "%SAM_TEMP_DIR%\SAM"
 echo Installing...
 install.bat > "%SAM_TEMP_DIR%\SAMcopy.log"
 popd
 echo %SAM_VER_NEW% > %SAM_VER_FLAG%
 rmdir "%SAM_TEMP_DIR%\SAM" /S /Q
 echo Success! SAM version %SAM_VER_NEW% now installed
) else (
 echo Lucky you, installed version %SAM_VER_CUR%is up to date!
)

timeout 60