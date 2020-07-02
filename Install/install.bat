set GH_PACKAGES_DIR=%APPDATA%\Grasshopper\Libraries\SAM\
if not exist "%GH_PACKAGES_DIR%" mkdir "%GH_PACKAGES_DIR%"

copy "SAM\*.*" "%GH_PACKAGES_DIR%"

