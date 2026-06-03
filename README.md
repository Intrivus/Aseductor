# Aseductor
- A simple batch script to conveniently compile Aseprite automatically.
- The script can be run in background.

> [!IMPORTANT]
> **Aseprite developers have released their own version of compiling automation.**
> However, this repository has been adapted to build upon that official automation, accelerating the compilation process. Contributions are welcome!

---

## Guides

### Setup & Installation
1. **Step 1:** Install Visual Studio and dependencies as mentioned in [Aseprite's INSTALL.md](https://github.com/aseprite/aseprite/blob/main/INSTALL.md#dependencies).
2. **Step 2:** Setting up CMake and Ninja as follow:
* Add `ninja.exe` to `C:\Program Files\CMake\bin` (or wherever CMake installation is located)
* Add `C:\Program Files\CMake\bin` to Path. Guide: [Path Tutorial Gist](https://gist.github.com/nex3/c395b2f8fd4b02068be37c961301caa7)


### Usage
* Modify `DEST_DIR` of the script to the desired location of compilation. By default it will be `Desktop`.
* The script will display the latest release version of Aseprite and prompt if the user want to proceed.
* It will then create a workspace folder in the same directory to extract and work on the source code.
* When prompted SKIA not found, press `ENTER` then continue with SKIA installation.
* The script will once again ask for user input to proceed, just press `ENTER`.

---

<details>
<summary> DEPRECATED: Semi-Manual Compilation (Click to expand)</summary>

## Old Setup (Legacy)

**Old Tutorial Video**: https://youtu.be/gsPpLAgT-iI (Outdated)

- Install Visual Studio and dependencies as mentioned in [Aseprite's INSTALL.md](https://github.com/aseprite/aseprite/blob/main/INSTALL.md#dependencies)
  * Add `ninja.exe` to `C:\Program Files\CMake\bin` (or wherever your CMake installation is located)
  * Add `C:\Program Files\CMake\bin` to Path. Guide: [Path Tutorial Gist](https://gist.github.com/nex3/c395b2f8fd4b02068be37c961301caa7)
- Install Skia and Aseprite source code (Latest version)
  * [Aseprite Releases](https://github.com/aseprite/aseprite/releases) (Skip if you use Method A)
  * [Skia Releases](https://github.com/aseprite/skia/releases) (install the Release version (NOT DEBUG))
- Put Skia and Aseprite in a folder in Downloads named `Compressed` (Yes, I used IDM)
- Create a folder named `Skia Windows` and a folder named `Aseprite` inside `Compressed`
  * In `Skia Windows`, create a new folder named `skia` then extract skia release files there
  * In `Aseprite`, extract the Aseprite source code inside (Skip if you use Method A)

> [!WARNING]
> Only extract the source inside those zip files.

### Old Compilation Methods
Install the older version of the script from [Releases](https://github.com/Perndoe/Aseductor/releases) and run as Administrator.

#### Method A: With Internet
* After opening the script, a browser tab will pop up. Find the Aseprite version you want and copy its link address.
* Paste it into the script window. It will install `asepritesc.zip` in `Downloads\Compressed`.
* ![image](https://github.com/Perndoe/Aseductor/assets/81963564/48c0c6af-b4ae-441a-9a52-0c0fd617ce68)

#### Method B: Without Internet
* Prepare the prerequisites in the folder structure manually.
* After opening the script, close the browser tab and type `skip` into the command prompt. Ignore any initial errors.

The script automatically compiles Aseprite to `C:/aseprite/build/bin`. Keep the `data` folder and `aseprite.exe` in `bin`, then remove the 3 other redundant files. Delete the `deps` and `aseprite` folders in `C:/` after moving your `bin` folder out.

### Compilation & Deleting Caches (`Aseductor.DelCache.bat`)
* Once compiled, this legacy tool moved the program to `Desktop/Compiled Aseprite` and cleared out `C:\deps` and `C:\aseprite`.

</details>

---

## Notes
- Because I don't have an Apple device, I can't really make a Mac version, sincerely sorry :(
- The original utility of this script was to automatically update Aseprite to the desired version through compilation.

### Credits & References
I was not familiar with batch back then, so these were the commands used in older versions:
- [File download from URL via Batch](https://stackoverflow.com/questions/4619088/windows-batch-file-file-download-from-a-url)
- [Unzip without third-party tools](https://stackoverflow.com/questions/21704041/creating-batch-script-to-unzip-a-file-without-additional-zip-tools)
- [Prevent PowerShell window from closing on error](https://stackoverflow.com/questions/24546150/how-can-prevent-a-powershell-window-from-closing-so-i-can-see-the-error)
- [How to make a chat bot in Batch](https://stackoverflow.com/questions/28481915/how-to-make-chat-bot-in-batch)
- [Open a web page in Windows Batch](https://stackoverflow.com/questions/26223936/open-a-web-page-in-a-windows-batch-file)
- [Batch script for renaming and moving files](https://stackoverflow.com/questions/19422604/batch-script-for-renaming-and-then-moving-files-from-1-folder-to-another)
- [Fixing Access Denied with move command](https://stackoverflow.com/questions/16502283/how-do-i-fix-access-denied-with-the-move-command-in-windows-7)
