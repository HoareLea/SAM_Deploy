@echo off

set GH_PACKAGES_DIR=%APPDATA%\Grasshopper\Libraries\
set GH_PACKAGES_R2020_DIR=%APPDATA%\Grasshopper\Libraries-Inside-Revit-2020\
set GH_PACKAGES_R2021_DIR=%APPDATA%\Grasshopper\Libraries-Inside-Revit-2021\
set GH_PACKAGES_R2022_DIR=%APPDATA%\Grasshopper\Libraries-Inside-Revit-2022\
set SAM_DIR=%APPDATA%\SAM\


if not exist "%GH_PACKAGES_DIR%" mkdir "%GH_PACKAGES_DIR%"
if not exist "%GH_PACKAGES_R2020_DIR%" mkdir "%GH_PACKAGES_R2020_DIR%"
if not exist "%GH_PACKAGES_R2021_DIR%" mkdir "%GH_PACKAGES_R2021_DIR%"
if not exist "%GH_PACKAGES_R2022_DIR%" mkdir "%GH_PACKAGES_R2022_DIR%"

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

echo #Order of files is important > "%GH_PACKAGES_R2022_DIR%SAM_Revit.ghlink"
echo %SAM_DIR%Revit 2022\SAM.Core.Grasshopper.Revit.gha >> "%GH_PACKAGES_R2022_DIR%SAM_Revit.ghlink"
echo %SAM_DIR%Revit 2022\SAM.Architectural.Grasshopper.Revit.gha >> "%GH_PACKAGES_R2022_DIR%SAM_Revit.ghlink"
echo %SAM_DIR%Revit 2022\SAM.Analytical.Grasshopper.Revit.gha >> "%GH_PACKAGES_R2022_DIR%SAM_Revit.ghlink"


set RV_PACKAGES_R2020_DIR=%APPDATA%\Autodesk\Revit\Addins\2020\RhinoInside.Revit\
set RV_PACKAGES_R2021_DIR=%APPDATA%\Autodesk\Revit\Addins\2021\RhinoInside.Revit\
set RV_PACKAGES_R2022_DIR=%APPDATA%\Autodesk\Revit\Addins\2022\RhinoInside.Revit\

xcopy /y "%~dp0Rhino.Inside\Revit 2020\*" "%RV_PACKAGES_R2020_DIR%"
xcopy /y "%~dp0Rhino.Inside\Revit 2021\*" "%RV_PACKAGES_R2021_DIR%"
xcopy /y "%~dp0Rhino.Inside\Revit 2022\*" "%RV_PACKAGES_R2022_DIR%"

move /y "%RV_PACKAGES_R2020_DIR%RhinoInside.Revit.GH.dll" "%RV_PACKAGES_R2020_DIR%RhinoInside.Revit.GH.gha"
move /y "%RV_PACKAGES_R2021_DIR%RhinoInside.Revit.GH.dll" "%RV_PACKAGES_R2021_DIR%RhinoInside.Revit.GH.gha"
move /y "%RV_PACKAGES_R2022_DIR%RhinoInside.Revit.GH.dll" "%RV_PACKAGES_R2022_DIR%RhinoInside.Revit.GH.gha"

set REVIT_ADDIN_SRC=%APPDATA%\SAM\SAM.addin
set RV_ADDIN_R2020_LINK=%APPDATA%\Autodesk\Revit\Addins\2020\SAM.addin
set RV_ADDIN_R2021_LINK=%APPDATA%\Autodesk\Revit\Addins\2021\SAM.addin
set RV_ADDIN_R2022_LINK=%APPDATA%\Autodesk\Revit\Addins\2022\SAM.addin

set RV_ADDIN_R2020_DLL=%APPDATA%\SAM\Revit 2020\SAM.Core.Revit.Addin.dll
set RV_ADDIN_R2021_DLL=%APPDATA%\SAM\Revit 2021\SAM.Core.Revit.Addin.dll
set RV_ADDIN_R2022_DLL=%APPDATA%\SAM\Revit 2022\SAM.Core.Revit.Addin.dll

setLocal EnableDelayedExpansion
if exist "%RV_ADDIN_R2020_LINK%" del "%RV_ADDIN_R2020_LINK%"
For /f "tokens=* delims= " %%a in (%REVIT_ADDIN_SRC%) do (
Set str=%%a
set str=!str:^<Assembly^>^</Assembly^>=^<Assembly^>%RV_ADDIN_R2020_DLL%^</Assembly^>!
echo !str!>>"%RV_ADDIN_R2020_LINK%"
)

if exist "%RV_ADDIN_R2021_LINK%" del "%RV_ADDIN_R2021_LINK%"
For /f "tokens=* delims= " %%a in (%REVIT_ADDIN_SRC%) do (
Set str=%%a
set str=!str:^<Assembly^>^</Assembly^>=^<Assembly^>%RV_ADDIN_R2021_DLL%^</Assembly^>!
echo !str!>>"%RV_ADDIN_R2021_LINK%"
)

if exist "%RV_ADDIN_R2022_LINK%" del "%RV_ADDIN_R2022_LINK%"
For /f "tokens=* delims= " %%a in (%REVIT_ADDIN_SRC%) do (
Set str=%%a
set str=!str:^<Assembly^>^</Assembly^>=^<Assembly^>%RV_ADDIN_R2022_DLL%^</Assembly^>!
echo !str!>>"%RV_ADDIN_R2022_LINK%"
)

echo All SAM components registered