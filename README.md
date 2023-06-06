# Aseductor
- A simple batch script with just copy and paste to compile aseprite automatically so that you can do your work while Aseprite is compiling in the background
- I've got the idea of making this script for a long time now as I see lots of people suffering trying to Compile Aseprite like myself. It took me a whole week to compile the program myself that's why I wanna help people
- Btw, I don't even know how to use bat. I search google for 70% of the code :D

# Setup

**Tutorial made by me**: https://youtu.be/gsPpLAgT-iI

- Install Visual Studio and dependencies as mentioned in https://github.com/aseprite/aseprite/blob/main/INSTALL.md#dependencies
  + Add ninja.exe to C:\Program Files\Ninja then add C:\Program Files\Ninja\ninja.exe to Path
  + Add C:\Program Files\CMake\bin to Path
  + (Recommend watching the video)
- Install Skia and Aseprite source code (Aseprite any versions)
  + https://github.com/aseprite/aseprite/releases
  + https://github.com/aseprite/skia/releases
- Put Skia and Aseprite in a folder in Downloads named "Compressed"
- Create a folder named "Skia Windows" and a folder named "Aseprite" in "Compressed"
  + In "Skia Windows" create a new folder named "skia" then extract skia release files there
  + In "Aseprite" extract Aseprite source code in

**Important**
- I'll make a video for new updates if you can't find it here
- Only extract the source code inside those zip files

I'll make a video soon although this is only a very simple batch script :D

# Installation
- Install the latest version of the script: https://github.com/Perndoe/Aseductor/releases
- Run the script as Administrator so that it'll copy the files to C:\
<br />
<br />**To make sure it work well, here are 2 ways of compiling**
<br />
- Need Internet:
  + After opening the script, a browser tab will pop up. Find the Aseprite version you wanted and copy its link address
  <br /> ![image](https://github.com/Perndoe/Aseductor/assets/81963564/48c0c6af-b4ae-441a-9a52-0c0fd617ce68) 
  <br /> (Currently copying "Aseprite-v1.3-rc4-Source.zip" link address)
  <br />
  + Then paste into the script window
  + Only do this method if you don't want to download Aseprite source code and set up it yourself
- No Internet
  + You must prepare the set up as shown in https://github.com/Perndoe/Aseductor/edit/main/README.md#setup
  + After opening the script, close the browser tab that open at the start and type "skip" into the command prompt.

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
