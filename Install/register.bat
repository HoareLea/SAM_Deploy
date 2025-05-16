@echo off

if "%1"=="" (
    set "YEARS=2020 2021 2022 2023 2024 2025 2026"
) else (
    set "YEARS=%*"
)

set GH_PACKAGES_DIR=%APPDATA%\Grasshopper\Libraries\
set SAM_DIR=%APPDATA%\SAM\

if not exist "%GH_PACKAGES_DIR%" mkdir "%GH_PACKAGES_DIR%"
echo #Order of files is important or just folder > "%GH_PACKAGES_DIR%SAM.ghlink"
echo %SAM_DIR% >> "%GH_PACKAGES_DIR%SAM.ghlink"

setlocal enabledelayedexpansion

for %%Y in (%YEARS%) do (
    set YEAR=%%Y
    echo Registering SAM !YEAR!
    set GH_PACKAGES_RYEAR_DIR=%APPDATA%\Grasshopper\Libraries-Inside-Revit-!YEAR!\
    set RV_PACKAGES_RYEAR_DIR=%APPDATA%\Autodesk\Revit\Addins\!YEAR!\RhinoInside.Revit\

    if not exist "!GH_PACKAGES_RYEAR_DIR!" mkdir "!GH_PACKAGES_RYEAR_DIR!"
    echo #Order of files is important > "!GH_PACKAGES_RYEAR_DIR!SAM_Revit.ghlink"
    
    for %%F in (Core, Architectural, Analytical) do (
        echo !SAM_DIR!Revit !YEAR!\SAM.%%F.Grasshopper.Revit.gha >> "!GH_PACKAGES_RYEAR_DIR!SAM_Revit.ghlink"
    )

    xcopy /y "%~dp0Rhino.Inside\Revit !YEAR!\*" "!RV_PACKAGES_RYEAR_DIR!"
    move /y "!RV_PACKAGES_RYEAR_DIR!RhinoInside.Revit.GH.dll" "!RV_PACKAGES_RYEAR_DIR!RhinoInside.Revit.GH.gha"
)

endlocal