REM Create build directory
if exist %~dp0build rmdir %~dp0build /S /Q
mkdir %~dp0build

REM Copy Rino.Inside files
mkdir %~dp0build\Rhino.Inside
xcopy /ys "..\SAM_Revit\references" "%~dp0build\Rhino.Inside"

REM Copy install scripts and files
xcopy /ys  "..\Install" "%~dp0build"

REM Copy SAM build files from local user appdata
mkdir %~dp0build\SAM
xcopy /ys "%appdata%\SAM\*" "%~dp0build\SAM"

REM Copy SAM grasshopper user objects from local user appdata
mkdir %~dp0build\SAMdependencies\GHUserObjects\SAM
xcopy /ys "%appdata%\Grasshopper\UserObjects\SAM" "%~dp0build\SAMdependencies\GHUserObjects\SAM"

REM Copy Revit addin manifest file
xcopy /y "..\SAM_Revit_UI\files\Addin\SAM.addin" "%~dp0build\SAM"

REM Copy SAM_Rino_UI files
set SAM_RHINO_UI=%APPDATA%\McNeel\Rhinoceros\packages\7.0\SAM
mkdir %~dp0build\SAM_Rhino_UI
xcopy /ys "%SAM_RHINO_UI%\*" "%~dp0build\SAM_Rhino_UI\"
echo  1.0.0 > "%~dp0build\SAM_Rhino_UI\manifest.txt"

REM Copy user resource files
xcopy /ys "%USERPROFILE%\Documents\SAM\" "%~dp0build\user\Documents\SAM\"

