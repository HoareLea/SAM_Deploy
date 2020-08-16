set GH_PACKAGES_DIR=%APPDATA%\Grasshopper\Libraries\
set GH_PACKAGES_R2020_DIR=%APPDATA%\Grasshopper\Libraries-Inside-Revit-2020\
set GH_PACKAGES_R2021_DIR=%APPDATA%\Grasshopper\Libraries-Inside-Revit-2021\
set SAM_DIR=%APPDATA%\SAM\

if not exist "%GH_PACKAGES_DIR%" mkdir "%GH_PACKAGES_DIR%"
if not exist "%GH_PACKAGES_R2020_DIR%" mkdir "%GH_PACKAGES_R2020_DIR%"
if not exist "%GH_PACKAGES_R2021_DIR%" mkdir "%GH_PACKAGES_R2021_DIR%"
if not exist "%SAM_DIR%" mkdir "%SAM_DIR%"

copy "SAM\*.*" "%SAM_DIR%"

echo #Order of files is important or just folder > "%GH_PACKAGES_DIR%SAM.ghlink"
echo %SAM_DIR% >> "%GH_PACKAGES_DIR%SAM.ghlink"

echo #Order of files is important > "%GH_PACKAGES_R2020_DIR%SAM_Revit.ghlink"
echo %SAM_DIR%Revit 2020\SAM.Core.Grasshopper.Revit.gha >> "%GH_PACKAGES_R2020_DIR%SAM_Revit.ghlink"
echo %SAM_DIR%Revit 2020\SAM.Architectural.Grasshopper.Revit.gha >> "%GH_PACKAGES_R2020_DIR%SAM_Revit.ghlink"
echo %SAM_DIR%Revit 2020\SAM.Analytical.Grasshopper.Revit.gha >> "%GH_PACKAGES_R2020_DIR%SAM_Revit.ghlink"

echo #Order of files is important > "%GH_PACKAGES_R2021_DIR%SAM_Revit.ghlink"
echo %SAM_DIR%Revit 2021\SAM.Core.Grasshopper.Revit.gha >> "%GH_PACKAGES_R2021_DIR%SAM_Revit.ghlink"
echo %SAM_DIR%Revit 2021\SAM.Architectural.Grasshopper.Revit.gha >> "%GH_PACKAGES_R2021_DIR%SAM_Revit.ghlink"
echo %SAM_DIR%Revit 2021\SAM.Analytical.Grasshopper.Revit.gha >> "%GH_PACKAGES_R2021_DIR%SAM_Revit.ghlink"





