call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" -arch=x64
@echo on

cd C:\
md "aseprite"\"build"
mkdir deps
xcopy.exe "%USERPROFILE%\Downloads\Compressed\Skia Windows" "C:/deps" /E
xcopy.exe "%USERPROFILE%\Downloads\Compressed\Aseprite" "C:/aseprite" /E

cd C:\aseprite\build

cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLAF_BACKEND=skia -DSKIA_DIR=C:\deps\skia -DSKIA_LIBRARY_DIR=C:\deps\skia\out\Release-x64 -DSKIA_LIBRARY=C:\deps\skia\out\Release-x64\skia.lib -G Ninja ..

ninja aseprite

pause >nul