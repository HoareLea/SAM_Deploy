@echo off

set GH_PACKAGES_LINK=%APPDATA%\Grasshopper\Libraries\SAM.ghlink
set GH_PACKAGES_R2020_LINK=%APPDATA%\Grasshopper\Libraries-Inside-Revit-2020\SAM_Revit.ghlink
set GH_PACKAGES_R2021_LINK=%APPDATA%\Grasshopper\Libraries-Inside-Revit-2021\SAM_Revit.ghlink
set SAM_DIR=%APPDATA%\SAM\

if exist "%GH_PACKAGES_LINK%" del "%GH_PACKAGES_LINK%"
if exist "%GH_PACKAGES_R2020_LINK%" del "%GH_PACKAGES_R2020_LINK%"
if exist "%GH_PACKAGES_R2021_LINK%" del "%GH_PACKAGES_R2021_LINK%"
if exist "%SAM_DIR%" rmdir "%SAM_DIR%" /Q /S

echo All SAM components uninstalled