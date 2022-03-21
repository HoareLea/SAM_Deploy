@echo off

set GH_PACKAGES_LINK=%APPDATA%\Grasshopper\Libraries\SAM.ghlink
set GH_PACKAGES_R2020_LINK=%APPDATA%\Grasshopper\Libraries-Inside-Revit-2020\SAM_Revit.ghlink
set GH_PACKAGES_R2021_LINK=%APPDATA%\Grasshopper\Libraries-Inside-Revit-2021\SAM_Revit.ghlink
set GH_PACKAGES_R2022_LINK=%APPDATA%\Grasshopper\Libraries-Inside-Revit-2022\SAM_Revit.ghlink
if exist "%GH_PACKAGES_LINK%" del "%GH_PACKAGES_LINK%"
if exist "%GH_PACKAGES_R2020_LINK%" del "%GH_PACKAGES_R2020_LINK%"
if exist "%GH_PACKAGES_R2021_LINK%" del "%GH_PACKAGES_R2021_LINK%"
if exist "%GH_PACKAGES_R2022_LINK%" del "%GH_PACKAGES_R2022_LINK%"

set RV_ADDIN_R2020_LINK=%APPDATA%\Autodesk\Revit\Addins\2020\SAM.addin
set RV_ADDIN_R2021_LINK=%APPDATA%\Autodesk\Revit\Addins\2021\SAM.addin
set RV_ADDIN_R2022_LINK=%APPDATA%\Autodesk\Revit\Addins\2022\SAM.addin
if exist "%RV_ADDIN_R2020_LINK%" del "%RV_ADDIN_R2020_LINK%"
if exist "%RV_ADDIN_R2021_LINK%" del "%RV_ADDIN_R2021_LINK%"
if exist "%RV_ADDIN_R2022_LINK%" del "%RV_ADDIN_R2022_LINK%"

echo All SAM components de-registered