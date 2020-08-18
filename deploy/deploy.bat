
@echo off
set SAM_VER_FLAG=%appdata%\SAM\version

echo Checking for latest SAM release...
curl\curl -s https://api.github.com/repos/HoareLea/SAM_Deploy/releases/latest | grep\grep -o -P "(?<="""tag_name""":\s""").*(?=""")" > %temp%\version
set /p SAM_VER_NEW=<%temp%\version
echo Latest SAM version is %SAM_VER_NEW%

if not exist %SAM_VER_FLAG% (
  set SAM_VER_CUR=""
) else (
  set /p SAM_VER_CUR=<%SAM_VER_FLAG%
)

if not %SAM_VER_NEW%==%SAM_VER_CUR% (
 echo Yay! Installing new SAM version%SAM_VER_NEW%
 echo Downloading...
 wget\wget.exe -N https://github.com/HoareLea/SAM_Deploy/releases/latest/download/SAM.zip
 echo Extracting...
 7zip\7za.exe x SAM.zip -oSAM
 pushd SAM
 echo Installing...
 install.bat
 popd
 echo %SAM_VER_NEW% > %SAM_VER_FLAG%
 rmdir SAM /S /Q
 echo Success! SAM version %SAM_VER_NEW% now installed
) else (
 echo Luck you, installed version %SAM_VER_CUR%is up to date!
)

