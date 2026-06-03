@echo off
setlocal EnableDelayedExpansion
TITLE Aseprite Compiler

:: =====================================================================
:: CONFIGURATION
:: =====================================================================
:: Set your final destination for the app here.
set "DEST_DIR=%USERPROFILE%\Desktop\Aseprite"

:: Define the workspace
set "WORK_DIR=%~dp0Aseprite_Work"

:: Define fallback directories
set "PF86=%ProgramFiles(x86)%"
set "VSWHERE_DIR=%PF86%\Microsoft Visual Studio\Installer"
set "VSWHERE=%VSWHERE_DIR%\vswhere.exe"
:: =====================================================================

echo =====================================================================
echo                 Aseprite Source Compiler
echo =====================================================================
echo.

:: STEP 1: Check the version of the latest release on GitHub
echo [INFO] Fetching latest Aseprite release info from GitHub...

:: Get the tag name and save it directly to a temporary file
powershell -NoProfile -Command "[Console]::Write(((Invoke-RestMethod -Uri 'https://api.github.com/repos/aseprite/aseprite/releases/latest').tag_name).Trim())" > "%TEMP%\aseprite_version.txt" 2>nul

set "LATEST_VERSION="
if not exist "%TEMP%\aseprite_version.txt" goto :ver_file_done
set /p LATEST_VERSION=<"%TEMP%\aseprite_version.txt"
del "%TEMP%\aseprite_version.txt"
:ver_file_done

:: Clean up trailing carriage returns or quotes from the variable
if "%LATEST_VERSION%"=="" goto :tag_clean_done
for /f "tokens=*" %%A in ("%LATEST_VERSION%") do set "LATEST_VERSION=%%~A"
:tag_clean_done

if not "%LATEST_VERSION%"=="" goto :version_ok
echo [ERROR] Failed to fetch the latest version tag from GitHub.
echo Please check your internet connection and try again.
goto :error_end

:version_ok
echo.
echo =====================================================================
echo LATEST ASEPRITE VERSION FOUND: %LATEST_VERSION%
echo =====================================================================
echo.

:: STEP 2: Prompt to proceed
set "CONFIRM="
set /p CONFIRM="Proceed with download and compilation? (Y/N): "
set "CONFIRM_CHAR=!CONFIRM:~0,1!"

if /i "!CONFIRM_CHAR!"=="Y" goto :proceed_download
echo [INFO] Operation cancelled by user.
goto :end

:proceed_download
:: Prepare Workspace (keeping original destination intact for safety)
if not exist "%WORK_DIR%" goto :make_work_dir
echo [INFO] Cleaning up previous work folder...
rmdir /S /Q "%WORK_DIR%"

:make_work_dir
mkdir "%WORK_DIR%"
cd /d "%WORK_DIR%"

:: Download
set "ZIP_URL=https://github.com/aseprite/aseprite/releases/download/%LATEST_VERSION%/Aseprite-%LATEST_VERSION%-Source.zip"
echo [INFO] Downloading Source Code (%LATEST_VERSION%)...
curl -L -o aseprite_src.zip "%ZIP_URL%"

if exist aseprite_src.zip goto :download_ok
echo [ERROR] Failed to download the source zip file!
goto :error_end

:download_ok

:: Extract
echo [INFO] Extracting source code...
mkdir src
tar -xf aseprite_src.zip -C src

:: Dynamically locate build.cmd
cd /d "%WORK_DIR%\src"
set "SRC_DIR="
for /r %%i in (build.cmd) do (
    if exist "%%i" (
        set "SRC_DIR=%%~dpi"
        goto :found_src
    )
)

if not "%SRC_DIR%"=="" goto :found_src
echo [ERROR] build.cmd not found in the extracted files!
goto :error_end

:found_src
cd /d "%SRC_DIR%"

:: STEP 3: Find and Run x64 Native Tools Command Prompt for VS
echo.
echo [INFO] Locating Visual Studio x64 Native Tools...

set "VCVARS="

:: Try using vswhere
if not exist "%VSWHERE%" goto :skip_vswhere
"%VSWHERE%" -latest -products * -requires Microsoft.VisualStudio.Workload.NativeDesktop -property installationPath > "%TEMP%\vs_path.txt" 2>nul
if not exist "%TEMP%\vs_path.txt" goto :skip_vswhere
set /p VS_PATH=<"%TEMP%\vs_path.txt"
del "%TEMP%\vs_path.txt"

if "%VS_PATH%"=="" goto :skip_vswhere
for /f "tokens=*" %%A in ("%VS_PATH%") do set "VS_PATH=%%~A"
set "VCVARS=%VS_PATH%\VC\Auxiliary\Build\vcvars64.bat"
if exist "%VCVARS%" goto :vs_found
:skip_vswhere

:: FALLBACK: Scan %ProgramFiles% for Visual Studio installations recursively
echo [INFO] Scanning Program Files for vcvars64.bat...
if not exist "%ProgramFiles%\Microsoft Visual Studio" goto :skip_pf_scan
cd /d "%ProgramFiles%\Microsoft Visual Studio"
for /r %%F in (vcvars64.bat) do (
    if exist "%%F" (
        set "VCVARS=%%F"
        goto :vs_found
    )
)
:skip_pf_scan

:: FALLBACK: Scan %ProgramFiles(x86)% for Visual Studio installations recursively
if not exist "%PF86%\Microsoft Visual Studio" goto :skip_pf86_scan
cd /d "%PF86%\Microsoft Visual Studio"
for /r %%F in (vcvars64.bat) do (
    if exist "%%F" (
        set "VCVARS=%%F"
        goto :vs_found
    )
)
:skip_pf86_scan

:: If non-existent, throw an error
if not "%VCVARS%"=="" goto :vs_found
echo [ERROR] Could not find vcvars64.bat anywhere on your system!
echo Please make sure 'Desktop development with C++' is installed in your Visual Studio 2026/v18 Installer.
goto :error_end

:vs_found
cd /d "%SRC_DIR%"
echo [INFO] Found Visual Studio Environment at: %VCVARS%
echo [INFO] Initializing Visual Studio x64 Native Tools...
call "%VCVARS%"

echo.
echo [INFO] Starting Aseprite compilation (build.cmd)...
echo [NOTE] You may need to press keys (like 'U' for User, and 'Y' to download Skia) during this process.
echo.
call build.cmd

:: Verify if compilation was successful
if exist "build\bin\aseprite.exe" goto :compile_success
echo.
echo [ERROR] Compilation appears to have failed. aseprite.exe was not found in:
echo %SRC_DIR%build\bin
goto :error_end

:compile_success
echo.
echo [INFO] Compilation successful!

:: STEP 4: Safe delete
if not exist "%DEST_DIR%" goto :copy_files
echo [INFO] Emptying and removing old version at: %DEST_DIR%
rmdir /S /Q "%DEST_DIR%"

:copy_files
mkdir "%DEST_DIR%"
echo [INFO] Moving compiled files to destination: %DEST_DIR%
xcopy "build\bin\*" "%DEST_DIR%" /E /Y /I >nul

:: Clean up temporary files
echo.
echo Aseprite compilation is finished!
echo Temporary work directory: %WORK_DIR%
set "CLEAN_CONFIRM="
set /p CLEAN_CONFIRM="Do you want to remove this temporary work folder? (Y/N): "
set "CLEAN_CHAR=!CLEAN_CONFIRM:~0,1!"

if /i "!CLEAN_CHAR!"=="Y" goto :do_clean
echo [INFO] Keeping temporary work folder at: %WORK_DIR%
goto :all_done

:do_clean
cd /d "%~dp0"
rmdir /S /Q "%WORK_DIR%"
echo [INFO] Work folder removed successfully.

:all_done
echo.
echo =====================================================================
echo ALL DONE! You can launch Aseprite from:
echo %DEST_DIR%\aseprite.exe
echo =====================================================================
goto :end

:error_end
echo.
echo =====================================================================
echo [CRITICAL ERROR] The compilation script stopped due to an error.
echo =====================================================================
echo.
pause
exit /b 1

:end
echo.
echo Press any key to exit...
pause >nul
exit /b 0