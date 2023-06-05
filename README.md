# Aseprite Compiler
A simple batch script with just copy and paste to compile aseprite automatically so that you can do your work while Aseprite is compiling in the background

# Setup
- Install Visual Studio and dependencies as mentioned in https://github.com/aseprite/aseprite/blob/main/INSTALL.md
- Install Skia and Aseprite source code (Aseprite any versions)
  + https://github.com/aseprite/aseprite/releases
  + https://github.com/aseprite/skia/releases
- Put Skia and Aseprite in a folder in Downloads named "Compressed"
- Create a folder named "Skia Windows" and a folder named "Aseprite" in "Compressed"
  + In "Skia Windows" create a new folder named "skia" then extract skia release files there
  + In "Aseprite" extract Aseprite source code in

**Important**
- Run the script as Admin else it won't copy the files
- Only extract the source code inside those zip files

I'll make a video soon although this is only a very simple batch script :D

# Others
- The script automatically compile aseprite in C:/aseprite/build/bin
- You can delete the deps or the aseprite folder in C:/ after finish compiling if you already moved the program
- Remember to keep "Skia Windows" folder for future updates and you could delete Aseprite source code
- The reason why I don't make it automatically install the Aseprite source code because you can install any versions you like
