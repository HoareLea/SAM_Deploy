@echo off

if "%1"=="" (
    set "YEARS=2020 2021 2022 2023 2024"
) else (
    set "YEARS=%*"
)

setlocal enabledelayedexpansion

for %%Y in (%YEARS%) do (
    set YEAR=%%Y

    set GH_PACKAGES_RYEAR_LINK=%APPDATA%\Grasshopper\Libraries-Inside-Revit-!YEAR!\SAM_Revit.ghlink
    if exist "!GH_PACKAGES_RYEAR_LINK!" del "!GH_PACKAGES_RYEAR_LINK!"

    set RV_ADDIN_RYEAR_LINK=%APPDATA%\Autodesk\Revit\Addins\!YEAR!\SAM.addin
    if exist "!RV_ADDIN_RYEAR_LINK!" del "!RV_ADDIN_RYEAR_LINK!"

    echo All SAM components de-registered for the year !YEAR!
)

endlocal