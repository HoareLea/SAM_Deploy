@echo off

if "%1"=="" (
    set YEARS=2020 2021 2022 2023 2024
) else (
    set YEARS=%*
)

setlocal enabledelayedexpansion

for %%Y in (%YEARS%) do (
    set YEAR=%%Y
    echo uninstalling SAM !YEAR!
    set GH_PACKAGES_RYEAR_LINK=%APPDATA%\Grasshopper\Libraries-Inside-Revit-!YEAR!\SAM_Revit.ghlink
    if exist "!GH_PACKAGES_RYEAR_LINK!" del "!GH_PACKAGES_RYEAR_LINK!"
    
    set RV_ADDIN_RYEAR_LINK=%APPDATA%\Autodesk\Revit\Addins\!YEAR!\SAM.addin
    if exist "!RV_ADDIN_RYEAR_LINK!" del "!RV_ADDIN_RYEAR_LINK!"
)

endlocal

set GH_PACKAGES_LINK=%APPDATA%\Grasshopper\Libraries\SAM.ghlink
if exist "%GH_PACKAGES_LINK%" del "%GH_PACKAGES_LINK%"

set SAM_DIR=%APPDATA%\SAM\
if exist "%SAM_DIR%" rmdir "%SAM_DIR%" /Q /S

set RH_ADDIN_DIR=%APPDATA%\McNeel\Rhinoceros\packages\7.0\SAM
if exist "%RH_ADDIN_DIR%" rmdir "%RH_ADDIN_DIR%" /Q /S

set RH_ADDIN_DIR=%APPDATA%\McNeel\Rhinoceros\packages\8.0\SAM
if exist "%RH_ADDIN_DIR%" rmdir "%RH_ADDIN_DIR%" /Q /S

echo All SAM components uninstalled
