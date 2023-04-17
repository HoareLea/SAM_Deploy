@echo off

if "%1"=="" (
    set "YEARS=2020 2021 2022 2023"
) else (
    set "YEARS=%*"
)

set GH_PACKAGES_DIR=%APPDATA%\Grasshopper\Libraries\
set SAM_DIR=%APPDATA%\SAM\

if exist "%SAM_DIR%" call "%~dp0uninstall.bat"

if not exist "%GH_PACKAGES_DIR%" mkdir "%GH_PACKAGES_DIR%"
if not exist "%SAM_DIR%" mkdir "%SAM_DIR%"

xcopy /ys "%~dp0SAM\*" "%SAM_DIR%"

echo #Order of files is important or just folder > "%GH_PACKAGES_DIR%SAM.ghlink"
echo %SAM_DIR% >> "%GH_PACKAGES_DIR%SAM.ghlink"


setlocal enabledelayedexpansion
for %%Y in (%YEARS%) do (
    set YEAR=%%Y
    
    echo Installing SAM !YEAR!
    set GH_PACKAGES_RYEAR_DIR=!APPDATA!\Grasshopper\Libraries-Inside-Revit-!YEAR!\
    if not exist "!GH_PACKAGES_RYEAR_DIR!" mkdir "!GH_PACKAGES_RYEAR_DIR!"

    echo #Order of files is important > "!GH_PACKAGES_RYEAR_DIR!SAM_Revit.ghlink"
    echo !SAM_DIR!Revit !YEAR!\SAM.Core.Grasshopper.Revit.gha >> "!GH_PACKAGES_RYEAR_DIR!SAM_Revit.ghlink"
    echo !SAM_DIR!Revit !YEAR!\SAM.Architectural.Grasshopper.Revit.gha >> "!GH_PACKAGES_RYEAR_DIR!SAM_Revit.ghlink"
    echo !SAM_DIR!Revit !YEAR!\SAM.Analytical.Grasshopper.Revit.gha >> "!GH_PACKAGES_RYEAR_DIR!SAM_Revit.ghlink"

    set RV_PACKAGES_RYEAR_DIR=!APPDATA!\Autodesk\Revit\Addins\!YEAR!\RhinoInside.Revit\
    xcopy /y "%~dp0Rhino.Inside\Revit !YEAR!\*" "!RV_PACKAGES_RYEAR_DIR!"
    move /y "!RV_PACKAGES_RYEAR_DIR!RhinoInside.Revit.GH.dll" "!RV_PACKAGES_RYEAR_DIR!RhinoInside.Revit.GH.gha"
    
    set RV_ADDIN_RYEAR_LINK=%APPDATA%\Autodesk\Revit\Addins\!YEAR!\SAM.addin
    
    if exist "!RV_ADDIN_RYEAR_LINK!" del "!RV_ADDIN_RYEAR_LINK!"
   
    for /f "tokens=* delims= " %%a in (!APPDATA!\SAM\SAM.addin) do (
        set "str=%%a"
        call set "str=%%str:<Assembly></Assembly>=<Assembly>%APPDATA%\SAM\Revit !YEAR!\SAM.Core.Revit.UI.dll</Assembly>%%"
        echo !str!>>"!RV_ADDIN_RYEAR_LINK!"
    )
)

endlocal

set RH_ADDIN_DIR=%APPDATA%\McNeel\Rhinoceros\packages\7.0\SAM\
if not exist "%RH_ADDIN_DIR%" mkdir "%RH_ADDIN_DIR%"
xcopy /ys "%~dp0SAM_Rhino_UI\*" "%RH_ADDIN_DIR%"

"%~dp0SAMdependencies/install.bat

echo All SAM components installed
