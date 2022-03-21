REM Create build directory
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
xcopy /y "..\SAM_Revit\files\Addin\SAM.addin" "%~dp0build\SAM"