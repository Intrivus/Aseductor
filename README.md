# Aseductor
- I've got the idea of making this script for a long time now as I see lots of people suffering trying to Compile Aseprite like myself. It took me a whole week to compile the program myself that's why I wanna help people
- A simple batch script with just copy and paste to compile aseprite automatically so that you can do your work while Aseprite is compiling in the background
- Btw, I don't even know how to use bat. I search google for 70% of the code :D

# Setup
- Install Visual Studio and dependencies as mentioned in https://github.com/aseprite/aseprite/blob/main/INSTALL.md#dependencies
- Install Skia and Aseprite source code (Aseprite any versions)
  + https://github.com/aseprite/aseprite/releases
  + https://github.com/aseprite/skia/releases
- Put Skia and Aseprite in a folder in Downloads named "Compressed"
- Create a folder named "Skia Windows" and a folder named "Aseprite" in "Compressed"
  + In "Skia Windows" create a new folder named "skia" then extract skia release files there
  + In "Aseprite" extract Aseprite source code in
- Tutorial made by me: https://youtu.be/gsPpLAgT-iI

**Important**
- New update: 
  + You don't need to install Aseprite source code at first if you don't want to because you can just copy the source code link and paste into the command prompt. (Tutorial soon)
  + If you still want to, install the source code like the Setup above.
- Run the script as Admin else it won't copy the files
- Only extract the source code inside those zip files

I'll make a video soon although this is only a very simple batch script :D

# Others
- The script automatically compile aseprite in C:/aseprite/build/bin
- You can delete the deps or the aseprite folder in C:/ after finish compiling if you already moved the program
- Remember to keep "Skia Windows" folder for future updates and you could delete Aseprite source code
- The reason why I don't make it automatically install the Aseprite source code because you can install any versions you like
- Links for commands that I don't know: 
  + https://stackoverflow.com/questions/4619088/windows-batch-file-file-download-from-a-url
  + https://stackoverflow.com/questions/21704041/creating-batch-script-to-unzip-a-file-without-additional-zip-tools
  + https://stackoverflow.com/questions/24546150/how-can-prevent-a-powershell-window-from-closing-so-i-can-see-the-error
  + https://stackoverflow.com/questions/28481915/how-to-make-chat-bot-in-batch
  + https://stackoverflow.com/questions/26223936/open-a-web-page-in-a-windows-batch-file
